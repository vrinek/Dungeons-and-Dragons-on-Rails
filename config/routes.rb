DnDoR::Application.routes.draw do
  resources :characters
  resources :non_player_characters
  resources :player_characters

  root to: 'characters#index'
end
