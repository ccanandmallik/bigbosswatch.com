# frozen_string_literal: true

Rails.application.routes.draw do
  # homepage
  root 'companies#index'

  # static pages
  get '/rules', to: 'static#rules'
  get '/faq', to: 'static#faq'

  # post resource
  resources :posts, only: %i[show create new]

  # company resource
  resources :companies, only: %i[show]

  # post flags
  get '/post_flags/:post_id/:flag_id', to: 'post_flags#index'
end
