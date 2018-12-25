# frozen_string_literal: true

Rails.application.routes.draw do
  scope :CuteGift do
    root to: 'cg/cg_app#index'
    namespace :cg do
      root to: 'cg_app#index'

      get 'index', to: 'cg_app#index'
      get 'login', to: 'users#login'
      post 'login', to: 'users#pass_check'
      get 'logout', to: '/sessions#destroy'

      namespace :users do
        get 'new'
        post 'new', action: :create
        get ':username', action: :show
      end

      namespace :pets do
        get 'new'
        post 'new', action: :create
        get ':petname', action: :show
      end

      scope :settings, as: 'settings' do
        namespace :users do
          root action: :edit
          patch '/', action: :update
        end
        namespace :pets do
          get ':petname', action: :edit
          patch ':petname', action: :update
        end
      end

      namespace :shares do
        root action: :list

        get 'new/:petname', action: :new, as: :new
        post 'new/:petname', action: :create, as: :create
        get ':share_id', action: :show
        patch ':share_id', action: :update
      end

      namespace :searchs do
        root action: :index
        get 'user', action: :user_index
        get 'pet', action: :pet_index
      end
    end
  end
end
