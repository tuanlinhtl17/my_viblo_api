# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "api/v1/posts#index"

  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
end
