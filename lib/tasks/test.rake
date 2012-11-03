task :test do
  at_exit { exit RSpec::Core::Runner.run(['spec']).to_i unless $! }
end
