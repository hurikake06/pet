Rails.application.routes.draw do
  scope :CuteGift do
    root to:'cg/cg_app#index'
    get 'index' => 'cg/cg_app#index'
    get 'login' => 'cg/users#login'
    post 'login/:user_mode' => 'cg/users#pass_check', as: 'login_request'
    get 'logout' => 'sessions#destroy'
    get 'ChangeMode/:user_mode' => 'sessions#mode_change', as: 'change_mode'

    namespace :user do
      get 'new' => '/cg/users#new'
      post 'new' => '/cg/users#new'
    end

    namespace :mypage do
      root to: '/cg/users#mypage'

      namespace :pet do
        get 'new' => '/cg/pets#new'
        post 'new' => '/cg/pets#new'
        get ':petname' => '/cg/pets#mypage'
        get ':petname/edit' => '/cg/pets#edit'
        post ':petname/edit' => '/cg/pets#update', as: 'edit_request'
      end
    end

    namespace :show do
      get ':username', to: '/cg/users#show'
      get ':username/pet/:petname', to: 'cg/pets#show', as: 'pet'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
