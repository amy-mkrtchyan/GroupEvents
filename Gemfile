source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'paranoia', '~> 2.3', '>= 2.3.1'
gem 'active_model_serializers', '~> 0.9.3'

group :development, :test do
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'faker', '~> 1.6', '>= 1.6.3'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'byebug'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
