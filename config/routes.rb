Rails.application.routes.draw do
  namespace :CuteGift do
    root to:'/cg/cg_app#index'
    get 'index' => '/cg/cg_app#index'
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
