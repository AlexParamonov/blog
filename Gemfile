source 'https://rubygems.org'

gem 'rails', '~>3.2.8'


gem 'jquery-rails', '~>2.0'
gem 'haml-rails', '~>0.3'
gem 'display_case', git: 'git://github.com/AlexParamonov/display-case.git', branch: 'message_delegation'
# gem 'display_case', path: '~/code/display-case'
gem 'fig_leaf'
gem 'hashugar', '~>0.0.6'

group :production do
  gem 'pg'
  gem 'unicorn'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'compass_twitter_bootstrap', git: 'git://github.com/tijsverkoyen/compass-twitter-bootstrap.git', branch: 'v2.2.1'


  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '~>1.3'
end

group :development do
  gem 'guard', '~>1.2'
  gem 'guard-shell', '~>0.5'
  gem 'capistrano'
  gem 'rvm-capistrano'
end

group :test do
  gem 'factory_girl', '~>4.1'
  gem 'kameleon', '~> 0.2'
end

group :test, :development do
  gem 'jazz_hands'
  gem 'sqlite3'
  gem "pry"
  gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"
  gem 'database_cleaner', '~>0.8'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
