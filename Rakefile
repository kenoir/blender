require 'rake'
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => [:spec,:features]

desc "run cucumber features"
Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
end

desc "run locally on port 5001"
task :run do
  `foreman start -p 5001`
end
