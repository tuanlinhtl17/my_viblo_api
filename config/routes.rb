# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  root to: "api/v1/posts#index"

  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments
      end

      resources :questions do
        resources :answers
      end

      resources :users, only: %i(index)
    end
  end
end
