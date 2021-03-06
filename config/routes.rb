Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :expenses
  resources :categories
  devise_scope :user do
    root to: "devise/sessions#new"
  end


  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
end
