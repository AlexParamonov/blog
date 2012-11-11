if defined?(RSpec)
  require 'rspec/core/rake_task'

  namespace 'test' do |ns|
    test_files             = 'spec/**/*_spec.rb'
    integration_test_files = 'spec/**/integration/**/*_spec.rb'
    acceptance_test_files  = 'spec/**/acceptance/**/*_spec.rb'

    desc "Run unit tests"
    RSpec::Core::RakeTask.new('unit') do |t|
      t.pattern = FileList[test_files] - FileList[integration_test_files] - FileList[acceptance_test_files]
      t.verbose = true
    end

    desc "Run integration tests"
    RSpec::Core::RakeTask.new('integration') do |t|
      t.pattern = FileList[integration_test_files]
      t.verbose = true
    end

    desc "Run acceptance tests"
    RSpec::Core::RakeTask.new('acceptance') do |t|
      t.pattern = FileList[acceptance_test_files]
      t.verbose = true
    end
  end

  desc "Run all tests"
  task 'test' => %w[test:unit test:integration test:acceptance]
end
