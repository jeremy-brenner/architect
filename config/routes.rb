Architect::Engine.routes.draw do
  root to: 'application#index'
  resources :tables
end
