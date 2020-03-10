require "capistrano/setup"

require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/rvm'
require 'capistrano/rbenv'
require 'capistrano/chruby'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/passenger'
require 'capistrano/puma'
require 'sshkit/sudo'
require 'whenever/capistrano'
require "capistrano/maintenance"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
install_plugin Capistrano::Puma
