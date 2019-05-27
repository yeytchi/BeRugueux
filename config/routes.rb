Rails.application.routes.draw do

  get 'drafts/create'
  get 'players/index'
  devise_for :users
  root to: 'seasons#index'

  resources :seasons, only:[:index, :new, :create, :show, :destroy] do
    resources :teams, only:[:new, :create, :show, :edit, :update] do
      resources :players, only: [:index] do
      end
      resources :drafts, only:[:new, :create, :index] do
      end
    end
  end
  #only admin except :show
  resources :players, only:[:show, :new, :create, :update, :edit, :destroy] do
  end

  resources :statistics, only:[:new, :create, :index, :update, :edit] do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
