Rails.application.routes.draw do
  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get 'signinAgain' => 'users/sessions#newAgain', as: :newAgain_user_session
    get 'signup0' => 'users/registrations#new0', as: :new0_user_registration
    get 'signupsns' => 'users/registrations#sns', as: :new_user_registration_sns
    # get 'signup1' => 'devise/registrations#new1', as: :new1_user_registration
    get 'signup2' => 'users/registrations#new2', as: :new2_user_registration
    get 'signup25' => 'users/registrations#new25', as: :new25_user_registration
    get 'signup4' => 'users/registrations#new4', as: :new4_user_registration
    get 'signup5' => 'users/registrations#new5', as: :new5_user_registration
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"

  resources :categories
  resources :items do
    get 'confirm_buy', on: :member
    resource :comment, only: [:create]
    collection do
      get 'search'
      get 'catesearch'
    end
    resources :itemimages
    resources :trades
  end
  resource :address, except: [:destroy, :show]
  resources :users, only: [:show, :edit, :destroy, :update]

  resources :users do
    resources :payments
  end
end
