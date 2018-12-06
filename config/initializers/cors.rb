module Api
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3000'
  
        resource '*',
          headers: :any,
          :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],        
          methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
  end