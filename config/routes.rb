Rails.application.routes.draw do
  devise_for :admins, :controllers => { 
    registrations: 'registrations'
  }, skip: [:sessions]
  as :admin do  
    get 'admin' => 'devise/sessions#new', as: :new_admin_session
    post 'admin' => 'devise/sessions#create', as: :admin_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_admin_session
  end

  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'messages#new'
  post 'contact' => 'messages#create'
  get 'upload' => 'images#new', as: 'upload'
  get 'gallery' => 'images#index', as: 'gallery'
  get 'admin/:id' => 'admin#show', as: 'show_admin'
  resources :categories
  resources :images, except: [:index, :new]
end
