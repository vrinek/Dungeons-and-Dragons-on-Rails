DnDoR::Application.routes.draw do
  resources :insider_data

  get "combat/initiative", as: 'initiative'

  resources :encounters
  resources :characters, :only => [:index, :destroy]
  resources :non_player_characters, :except => [:index, :destroy]

  root to: 'characters#index'
end
