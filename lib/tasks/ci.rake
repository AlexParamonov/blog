if defined?(RSpec)
  require 'rspec/core/rake_task'

  namespace :ci do
    desc "Run tests"
    RSpec::Core::RakeTask.new('tests') do |t|
      t.pattern = 'spec/**/*_spec.rb'
      t.rspec_opts = '-fprogress'
      t.verbose = true
    end
  end
end
