Rails.application.routes.draw do
  root to: 'api/v1/books#index'

    namespace :api do
      namespace :v1 do

        resources :users, only:[:index,:create]

        resources :auth_token, only:[:create] do
          collection do
            post :user_create
            post :refresh
            delete :destroy
          end
        end

        resources :books, only:[:index,:create] do
          collection do
            get 'main/:id',       to: 'books#main'
            get 'show/:id',       to: 'books#show_books'
            get 'kind/:kind',     to: 'books#show'
            get 'kind/:kind/:id', to: 'books#show_id'
            get 'detail/:id',     to: 'books#detail'
            get 'lend/:id',       to: 'books#lend_books'
            get 'favorite/:id',   to: 'books#favorite'
            get 'search/:keyword',to: 'books#search'
            patch 'lending',      to: 'books#lending'
            patch 'return',       to: 'books#return'
          end
        end

        get  'reviews/:id', to: 'reviews#book_reviews'
        post 'reviews/create', to: 'reviews#create'

        post 'favarites/on', to: 'favarites#on'
        delete 'favarites/off', to: 'favarites#off'

      end
    end
  end