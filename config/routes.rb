Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #movies ルーティング
  resources :movies
  #シート ルーティング
  get 'sheets' => 'sheets#index'
  get 'movies/:id/schedules/:id/sheets' => 'sheets#index'
  get  '/movies/:id/schedules/:id/reservations/new' => 'reservations#new'
  resources :reservations
  #管理者 ルーティング
  namespace :admin do
    resources :movies, except: [:create]
    post "/movies/new" => 'movies#create'
    #スケジュール
    resources :schedules
    get '/movies/:id/schedules/new' => 'schedules#new'
    # post '/movies/:id' => 'schedules#new'
    # post '/movies/:id' => 'schedules#create'
    post '/movies/:id/schedules/new' => 'schedules#new'
    post '/movies/:id/schedules/new' => 'schedules#create'
    # 予約

  end
end
