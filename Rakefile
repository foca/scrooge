require "spec/rake/spectask"

begin
  require "mg"
  MG.new("scrooge.gemspec")

  task :build => :vendor
rescue LoadError
end

desc "Default: run specs"
task :default => :spec

Spec::Rake::SpecTask.new do |task|
  task.spec_opts << "--color"
end
