Rails.application.routes.draw do
  resources :categories
  resources :pages
  resources :stories do
    resources :careers do
      resources :story_questions
    end
  end
  get "admin",        to: "admin#index",          as: :admin
  get "blog",         to: "home#blog",            as: :blog
  get "about",        to: "home#about",           as: :about
  get "contact",      to: "home#contact",         as: :contact
  get "submit-story", to: "home#submit_story",    as: :submit_story
  post "filter_by",   to: "home#filter_by",       as: :filter_by
  post "sort_by",     to: "home#sort_by",         as: :sort_by

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
