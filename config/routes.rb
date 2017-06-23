Rails.application.routes.draw do
  #  sessions routes
  get 'sessions' => 'sessions#index'
  get 'sessions/login_l' => 'sessions#login_b'
  get 'sessions/login_b' => 'sessions#login_l'
  delete 'sessions/:id' => 'sessions#destroy'
  post 'sessions' => 'sessions#create_l'
  put 'sessions' => 'sessions#create_b'
  # lenders routes
  post 'lenders' => 'lenders#create'
  get 'lenders/:id' => 'lenders#show'

  # borrowers
  post 'borrowers' => 'borrowers#create'
  get 'borrowers/:id' => 'borrowers#show'
  # histories
  post 'histories/:id' => 'histories#create'
  root 'sessions#index'
end
