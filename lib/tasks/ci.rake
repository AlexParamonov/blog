namespace :ci do
  task :tests do
    Rails.env = 'test'
    at_exit { exit RSpec::Core::Runner.run(['spec', '-fprogress']).to_i unless $! }
  end
end
