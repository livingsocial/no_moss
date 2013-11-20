require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc 'Default: run specs.'
task :default => :spec

desc 'Run specs'
RSpec::Core::RakeTask.new(:spec)

# Don't push to rubygems.org, thanks
module Bundler
  class GemHelper
    protected
    def rubygem_push(path)
      puts "Skipping the part where we deploy to rubygems..."
    end
  end
end
