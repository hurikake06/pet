Rails.application.routes.draw do
  namespace :CuteGift do
    root to:'/cg/cg_app#index'
    get 'index' => '/cg/cg_app#index'

    namespace :pet do
      root to: '/cg/pets#mypage'
      get 'mypage' => '/cg/pets#mypage'
      get 'new' => '/cg/pets#new'
      get 'edit' => '/cg/pets#edit'
    end

    namespace :user do
      root to: '/cg/users#mypage'
      get 'mypage' => '/cg/users#mypage'
      get 'new' => '/cg/users#new'
      get 'login' => '/cg/users#login'
<<<<<<< HEAD
      post 'login' => '/cg/users#login_check'
      get ':username' => '/cg/users#show'
=======
>>>>>>> ログインフォーム追加
    end
  end
  
  get 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
