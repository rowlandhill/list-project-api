# frozen_string_literal: true
Rails.application.routes.draw do
  resources :recipes, only: [:new, :edit, :create, :index, :show, :destroy, :update]
  resources :ingredients, only: [:new, :edit, :create, :index, :show, :destroy, :update]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
