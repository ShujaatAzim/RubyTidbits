Rails.application.routes.draw do
  root 'static_pages#tidbits', as: "tidbits"
  get '/palindrome', to: "static_pages#palindrome", as: "palindrome"
  post '/palindrome', to: "application#palindrome_check", as: "palindrome_check"
  get '/guessing_game', to: "static_pages#guessing_game", as: "guessing_game"
  post '/guessing_game', to: "application#guessing_game_check", as: "guessing_game_check"
  get '/largest_prime', to: "static_pages#largest_prime", as: "largest_prime"
  post '/largest_prime', to: "application#largest_prime_check", as: "largest_prime_check"
end
