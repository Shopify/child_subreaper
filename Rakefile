# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

require "rake/extensiontask"

if RUBY_PLATFORM =~ /linux/i
  task build: :compile

  Rake::ExtensionTask.new("child_subreaper") do |ext|
    ext.lib_dir = "lib/child_subreaper"
  end

  task default: %i[clobber compile test]
else
  task default: :test
end