set :stage, :production
    server 128.199.55.71, user: my_service, roles: %w(web app db)

    set :branch, 'production'
    set :deploy_to, '/home/my_service/production'

    fetch(:default_env).merge!(rails_env: :production)