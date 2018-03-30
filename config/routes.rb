Rails.application.routes.draw do
  resources :markets do
    member do
      post :update_buy
    end
  end
end
