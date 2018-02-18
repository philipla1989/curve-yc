Rails.application.routes.draw do
  devise_for :users
  resources :posts, param: :slug
  resources :categories
  resources :pages
  resources :admin
  resources :stories, param: :slug do
    resources :careers do
      resources :jobs
      resources :story_questions
    end
  end
  get   "admin/reset_password/:id",                   to: "admin#reset_password",         as: :reset_password_admin
  get   "blog",                                       to: "home#blog",                    as: :blog
  get   "browse",                                     to: "home#browse",                  as: :browse
  get   "browse/explore",                             to: "home#browse_explore",          as: :browse_explore
  get   "browse/pursue",                              to: "home#browse_pursue",           as: :browse_pursue
  get   "browse/explore/:ini_career/to/:sub_career",  to: "home#browse_stories_explore",  as: :browse_stories_explore
  get   "browse/pursue/:sub_career/to/:ini_career",   to: "home#browse_stories_pursue",   as: :browse_stories_pursue
  get   "about",                                      to: "home#about",                   as: :about
  get   "contact",                                    to: "home#contact",                 as: :contact
  get   "submit-story",                               to: "home#submit_story",            as: :submit_story
  post  "filter_by",                                  to: "home#filter_by",               as: :filter_by
  get   "sort_by",                                    to: "home#sort_by",                 as: :sort_by
  get   "dynamic_filter",                             to: "home#dynamic_filter",          as: :dynamic_filter

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
