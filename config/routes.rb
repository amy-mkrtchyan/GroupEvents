Rails.application.routes.draw do

  # constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        resources :group_events do
          member do
            put :publish
          end
        end
      end
    end
  # end
end
