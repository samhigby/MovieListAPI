Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :lists 
    resources :movies
    post 'lists/:list_id/movies', to: 'movies#add_to_list'
    delete 'lists/:list_id/movies/:movie_id', to: 'movies#remove_from_list'
  end
end
