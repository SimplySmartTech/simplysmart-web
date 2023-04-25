Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/about_us' => "home#about_us"
  get '/solutions' => "home#solutions"
  get '/clients' => "home#clients"
  get 'contact_us' => "home#contact_us"
end
