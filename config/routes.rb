Rails.application.routes.draw do


  # devise_for :users
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'patients/index'
  root to: "patients#index"






end
