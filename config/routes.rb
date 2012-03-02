DnDoR::Application.routes.draw do
  resources :encounters

  resources :character_races

  resources :characters, :only => [:index, :destroy]
  resources :non_player_characters, :except => [:index, :destroy]

  root to: 'characters#index'
end
