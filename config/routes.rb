Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :books do
    collection do
      get :collection
      get :wishlist
    end
  end
end
