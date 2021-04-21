Rails.application.routes.draw do
  root 'static_pages#tidbits', as: "tidbits"
  get '/palindrome', to: "static_pages#palindrome", as: "palindrome"
  post '/palindrome', to: "application#palindrome_check", as: "palindrome_check"
  get '/guessing_game', to: "static_pages#guessing_game", as: "guessing_game"
  post '/guessing_game', to: "application#guessing_game_check", as: "guessing_game_check"
  get '/largest_prime', to: "static_pages#largest_prime", as: "largest_prime"
  post '/largest_prime', to: "application#largest_prime_check", as: "largest_prime_check"
  get '/dice_roll', to: "static_pages#dice_roll", as: "dice_roll"
  post '/dice_roll', to: "application#dice_roll_check", as: "dice_roll_check"
  get '/coin_flip', to: "static_pages#coin_flip", as: "coin_flip"
  post '/coin_flip', to: "application#coin_flip_check", as: "coin_flip_check"
end
