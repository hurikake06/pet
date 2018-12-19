# frozen_string_literal: true

Rails.application.routes.draw do
  scope :CuteGift do
    root to: 'cg/cg_app#index'
    get 'index' => 'cg/cg_app#index'
    get 'login' => 'cg/users#login'
    post 'login' => 'cg/users#pass_check'
    get 'logout' => 'sessions#destroy'

    namespace :user do
      get 'new' => '/cg/users#new'
      post 'new' => '/cg/users#new'
    end

    namespace :setting do
      root to: '/cg/users#edit'
      post '/' => '/cg/users#edit'
      namespace :pet do
        get ':petname' => '/cg/pets#edit'
        patch ':petname' => '/cg/pets#edit'
      end
    end

    namespace :mypage do
      root to: '/cg/users#mypage'

      namespace :pet do
        get 'new' => '/cg/pets#new'
        post 'new' => '/cg/pets#new'
        get ':petname' => '/cg/pets#mypage'
      end
    end

    namespace :show do
      get ':username', to: '/cg/users#show'
      get 'pet/:petname', to: '/cg/pets#show', as: 'pet'
    end

    namespace :share do
      root to: '/cg/shares#list'
      get 'list', to: '/cg/shares#list'
      get 'new/:petname', to: '/cg/shares#new', as: 'new'
      post 'new/:petname', to: '/cg/shares#new'

      get 'show/user/:share_id', to: '/cg/shares#show_user', as: 'show_user'
      get 'show/host/:share_id', to: '/cg/shares#show_host', as: 'show_host'

      get 'dm/:share_id', to: '/cg/dm_groups#show_share', as: 'dm'
      post 'dm/:share_id', to: '/cg/dm#new'
    end

    namespace :dm do
      root to: '/cg/dm_groups#list'
      get 'list', to: '/cg/dm_groups#list'
      get ':petname', to: '/cg/dm_groups#show'
      post ':petname', to: '/cg/dm#new'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
