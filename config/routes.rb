Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
    get 'orders/index'
  end
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :end_users

  namespace :admin do
    resources :items, only: [:index, :new, :create]
    resources :end_users, only: [:index]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end


  namespace :public do
    resources :end_users, only: [:show, :edit, :update, :destroy] do
      resources :cart_items, only: [:index]
      resources :orders, only: [:new, :create, :update]
      get "orders/:id/confirm", to: "orders#confirm", as: "order_confirm"
      get "orders/:id/thanks", to: "orders#thanks", as: "order_thanks"
      resources :addresses, only: [:create]
      resources :order_details, only: [:create]
    end
    resources :items, only: [:index, :show], param: :id
    resources :cart_items, only: [:create, :destroy, :update]
 delete "public/cart_items", to: "cart_items#destroy_all", as: "destroy_cart_items"
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
