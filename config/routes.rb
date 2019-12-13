Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get "about_us" => "home#about_us", as: "about_us"
  get "contact_us" => "contact_us#index", as: "contact_us"
  post "contact_us" => "contact_us#create", as: "save_contact_us"
  get 'location/:permalink' => 'locations#show', as: 'location'
  get 'products/:category' => 'products#index', as: 'products'
  get 'products/:category/:permalink' => 'products#show', as: 'product'
  get 'promo/:type' => 'promotions#index', as: 'promo'
  get 'promo/:type/detail/:permalink' => 'promotions#show', as: 'promo_detail'
  get 'promo/:type/detail-modal/:permalink' => 'promotions#modal_show', as: 'promo_detail_modal'
  post 'subscribe' => 'home#subscribe', as: 'subscribe'

  get    '/login' => 'session#new', as: "login"
  post   '/login' => 'session#create', as: "login_create"
  delete '/logout' => 'session#destroy', as: "logout"

  get "admin" => "admin/dashboard#index", as: "admin"
  namespace :admin do
    resources :banners
    resources :categories
    resources :locations do
      member do
        resources :location_images, except: [:index], param: :location_image_id
      end
    end
    resources :pages
    resources :products do
      collection do
        post :reload_brand
      end
      member do
        resources :product_images, except: [:index], param: :product_image_id
      end
    end
    resources :promotion_codes
    resources :promotions
    resources :sauces
    resources :subscribers
  end
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
