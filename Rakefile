require_relative "./config/environment"
require "sinatra/activerecord/rake"

desc "Start the console"
task :console do
  require "pry"
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
