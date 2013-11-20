require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require 'rake/testtask'
desc "Run Test::Unit tests"
Rake::TestTask.new(:'test-unit') do |t|
  t.test_files = FileList['test-unit/*_test.rb']
  t.verbose = true
end

task :default => %w[ spec test-unit ]
