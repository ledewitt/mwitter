require          'bundler/setup'
require          'sinatra/activerecord/rake'
require_relative 'config/database'

desc "Launch a console with our environment loaded"
task :console do
  require          'irb'
  require_relative 'lib/mwitter'
  ARGV.clear
  $PROGRAM_NAME = 'irb'
  IRB.start
end
