require 'rspec/core/rake_task'

require_relative 'app/main.rb'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "It extracts the highests city for each county from the csv"
task :extract do
  Main.run ARGV[1]
end
