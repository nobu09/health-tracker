# config/initializers/cors.rb
# https://github.com/cyu/rack-cors?tab=readme-ov-file#rails-configuration

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:5173' # React からのアクセスを許可

    resource '*',
             headers: :any,
             methods: [:get, :post, :patch, :put]
  end
end
