import Config

config :assignment_first, ecto_repos: [First.Repo]
config :assignment_first,First.Repo,
  database: "To-Do",
  username: "sayan",
  password: "sayan1231",
  hostname: "localhost"

#uncomment during testing, don't use while not testing
#import_config "#{config_env()}.exs"
