require 'rake'
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

desc "run cucumber features"
Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
end
