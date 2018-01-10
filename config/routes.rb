Rails.application.routes.draw do
  resources :posts
  resources :categories
  resources :pages
  resources :stories do
    resources :careers do
      resources :story_questions
    end
  end
  get "admin",          to: "admin#index",          as: :admin
  get "blog",           to: "home#blog",            as: :blog
  get "browse",         to: "home#browse",          as: :browse
  get "browse/explore", to: "home#browse_explore",  as: :browse_explore
  get "browse/pursue",  to: "home#browse_pursue",   as: :browse_pursue
  get "browse/stories", to: "home#browse_stories",  as: :browse_stories
  get "about",          to: "home#about",           as: :about
  get "contact",        to: "home#contact",         as: :contact
  get "submit-story",   to: "home#submit_story",    as: :submit_story
  post "filter_by",     to: "home#filter_by",       as: :filter_by
  get "sort_by",        to: "home#sort_by",         as: :sort_by

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
