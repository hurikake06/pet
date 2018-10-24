Rails.application.routes.draw do
  namespace :CuteGift do
    root to:'/cg/cg_app#index'
    get 'index' => '/cg/cg_app#index'
    get 'login' => '/cg/users#login'
    post 'login' => '/cg/users#login_check'
    get 'logout' => '/sessions#destroy'

    namespace :user do
      get 'new' => '/cg/users#new'
    end

    namespace :mypage do
      root to: '/cg/users#mypage'

      namespace :pet do
        get 'new' => '/cg/pets#new'
        post 'new' => '/cg/pets#new'
        get ':petname' => '/cg/pets#mypage'
        get ':petname/edit' => '/cg/pets#edit'
      end
    end

    namespace :show do
      get ':username', to: '/cg/users#show'
      get ':username/pet/:petname', to: '/cg/pets#show'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
