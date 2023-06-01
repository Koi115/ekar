Rails.application.routes.draw do


  # devise_for :users  <= 管理者ユーザログイン中に、ユーザ登録画面へ遷移できるようにルート変更
  devise_for :users, controllers: { registrations: 'registrations' }
  
  # get 'patients/index'
  root to: "patients#index"
  resources :patients, only: [:index, :new, :create, :show, :edit, :update]





end
