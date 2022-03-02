require_relative './config/environment'
require 'sinatra/activerecord/rake'

def reload 
    load_all "./app" if Dir.exists?("./app")
end


desc "rake console"
task :console do 
    puts "Loading the environment..."
    reload
    puts "Starting the pry console..."
    Pry.start
end

desc "reset db"
task :reset_db do
    puts "Dropping the db"
    system "rm ./db/development.sqlite"
    system "rm ./db/test.sqlite"
    system "rm ./db/production.sqlite"
    system "rm ./db/schema.rb"
    puts "Running migrations"
    system "rake db:migrate"
    puts "Seeding the database"
    system "rake db:seed"
    puts "Done seeding!"

end