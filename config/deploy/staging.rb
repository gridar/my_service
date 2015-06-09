set :stage, :staging
    server 128.199.55.71, user: my_service, roles: %w(web app db)

    set :branch, 'staging'
    set :deploy_to, '/home/my_service/staging'

    fetch(:default_env).merge!(rails_env: :staging)