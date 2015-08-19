set :stage, :staging
# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

 server '54.148.29.208', user: 'ubuntu', roles: %w{app db web}
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
# server 'db.example.com', user: 'deploy', roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

 role :app, %w{54.148.29.208}
 role :web, %w{54.148.29.208}
 role :db,  %w{54.148.29.208}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.
  set :application, 'Michef'
  set :repo_url, 'git@github.com:idyllicsoftware/michef.git'
  set :branch, "staging"
  set :rails_env, "staging"
  set :rvm_ruby_version, 'ruby-2.1.5@michef'
  set :user, "ubuntu"
  set :deploy_to, '/srv/apps/michef'
  set :bundle_gemfile, -> { release_path.join('Gemfile') }
  set :bundle_dir, -> { shared_path.join('vendor/bundle') }
  set :bundle_flags, '--deployment'
  set :bundle_without, %w{development test}.join(' ')
  set :bundle_binstubs, -> { shared_path.join('bin') }
  set :bundle_roles, :all


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
