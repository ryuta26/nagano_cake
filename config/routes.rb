Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :end_users

  namespace :admin do
    resources :items, only: [:index, :new, :create]
    resources :end_users, only: [:index]
  end


  namespace :public do
    resources :end_users, only: [:show, :edit, :update, :destroy]
    resources :items, only: [:index], param: :id
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
