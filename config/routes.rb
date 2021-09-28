Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get '/', to: redirect('/api-docs')

  resources :users do
    resources :granted_accesses
  end

  delete '/users/:user_id/granted_accesses/', controller: "granted_accesses", action: "destroy_all"

  resources :images do
    resources :protected_actions

    post :transfer_ownership
    post :publicize
    post :privatize

    get ":mode/:unique_name", constraints: { :unique_name => /[^\/]+/ }, controller: "images", action: "view", on: :collection
  end
end
