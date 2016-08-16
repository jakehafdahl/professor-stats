defmodule ProfessorStats.PlayerTable do
	@moduledoc """
	Implementation of a player table to store key value pairs in a callable process
	"""

	@doc """
	Starts a new player.
	"""
	def start_link do
		Agent.start_link(fn -> %{} end)
	end

	@doc """
	Gets a value with a given 'key' from the player
	"""
	def get(player, key) do
		Agent.get(player, &Map.get(&1, key))
	end

	@doc """
	Puts a value in the player for the given key
	"""
	def put(player, key, value) do
		Agent.update(player, &Map.put(&1, key, value))
	end

	@doc """
	Deletes a key from the player
	"""
	def delete(player, key) do
		Agent.get_and_update(player, &Map.pop(&1, key))
	end
end