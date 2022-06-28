Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #movies ルーティング
  resources :movies do
    #シート ルーティング
    resources :schedules do
      #シート ルーティング
      resources :sheets
      resources :reservations, except: [:create]
    end
  end
  
  post "reservations", to: "reservations#create"

  # get  'movies/:id/schedules/:id/reservations/new' => 'reservations#new', as: 'new_reservation'
  # post 'movies/:id/schedules/:id/reservations/new' => 'reservations#create', as: 'reservations'
  # post 'reservations' => 'reservations#create'
  #管理者 ルーティング
  namespace :admin do
    resources :movies, except: [:create]
    post "movies/new" => 'movies#create'
  end
end
