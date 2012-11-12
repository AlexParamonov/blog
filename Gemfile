source 'https://rubygems.org'

gem 'rails', '~>3.2.8'


gem 'jquery-rails', '~>2.0'
gem 'haml-rails', '~>0.3'
gem 'display_case', git: 'git://github.com/AlexParamonov/display-case.git', branch: 'message_delegation'
gem 'fig_leaf'
gem 'hashugar', '~>0.0.6'

group :production do
  gem 'pg'
  gem 'unicorn'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
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
  gem 'kameleon', git: 'git://github.com/AlexParamonov/kameleon.git'
end

group :test, :development do
  gem 'jazz_hands' unless defined?(Rubinius)
  gem 'sqlite3'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rspec-core',         git: 'git://github.com/rspec/rspec-core.git'
  gem 'database_cleaner', '~>0.8'
end
