# ProfessorStats

**An elixir project that will generate customized start/sit information for fantasy teams given a configurable set of projections

###System requirements
- MySQL via homebrew or https://www.mysql.com/downloads/
- [Elixir](http://elixir-lang.org/install.html)

##Setup
1. Clone the repository
```bash
git clone https://github.com/jakehafdahl/email-service
```

2. Get the dependencies
```bash
mix deps.get
```

3. Create the professor_stats schema in MySQL

4. Run the ecto migrations
mix ecto.migrate

5. Run the project 
iex -S mix

###License

[MIT License](http://www.opensource.org/licenses/MIT)