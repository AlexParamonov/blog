task :test do
  Rails.env = 'test'
  at_exit { exit RSpec::Core::Runner.run(['spec']).to_i unless $! }
end
