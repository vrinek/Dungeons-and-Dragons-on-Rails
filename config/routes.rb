DnDoR::Application.routes.draw do
  get "combat/initiative", as: 'initiative'

  resources :powers
  resources :encounters
  resources :character_races
  resources :characters, :only => [:index, :destroy]
  resources :non_player_characters, :except => [:index, :destroy]

  root to: 'characters#index'
end
