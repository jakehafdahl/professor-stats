defmodule ProfessorStats.CalcRegistry do
	use GenServer

	def start_link(name) do
		GenServer.start_link(__MODULE__, name, name: name)
	end

	@doc """
	Looks up the agent pid for `player_id` stored in `server`.

  	Returns `{:ok, player}` if the bucket exists, `:error` otherwise.
	"""
	def lookup(server, player_id) do
		case :ets.lookup(server, player_id) do
			[{^player_id, player}] -> {:ok, player}
			[] -> :not_found
		end
	end

	@doc """
	Ensures there is a player map associated to the given `player_id` in `server`.
	"""
	def create(server, player_id) do
		GenServer.call(server, {:create, player_id})
	end

	@doc """
	Stops the registry
	"""
	def stop(server) do
		GenServer.stop(server)
	end

	## Server callbacks
	
	def init(table) do
		players = :ets.new(table, [:named_table, read_concurrency: true])
		refs = %{}
		{:ok, {players, refs}}
	end

	def handle_call({:create, player_id}, _from, {players, refs}) do
	    case lookup(players, player_id) do
		    {:ok, pid} ->
		        {:reply, pid, {players, refs}}
		    :not_found ->
		        {:ok, pid} = ProfessorStats.PlayerTable.Supervisor.start_table
		        refs = Map.put(refs, Process.monitor(pid), player_id)
		        :ets.insert(players, {player_id, pid})
		        {:reply, pid, {players, refs}}
	    end
	  end

	@doc """
	Handles when a PlayerTable goes down by removing it from the registry
	"""
	def handle_info({:DOWN, ref, :process, _pid, _reason}, {players, refs}) do
		{player_id, refs} = Map.pop(refs, ref)
		:ets.delete(players, player_id)
		{:noreply, {players, refs}}
	end

	def handle_info(_msg, state) do
		{:noreply, state}
	end
end