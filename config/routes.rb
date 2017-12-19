Rails.application.routes.draw do
  resources :stories
  get "admin",        to: "admin#index",          as: :admin
  get "blog",         to: "home#blog",            as: :blog
  get "about",        to: "home#about",           as: :about
  get "contact",      to: "home#contact",         as: :contact
  get "submit-story", to: "home#submit_story",    as: :submit_story

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
