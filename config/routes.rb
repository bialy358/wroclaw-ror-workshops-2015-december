Rails.application.routes.draw do

  devise_for :users

  root 'visitors#index'

  resources :students do
    get :subjects
  end
  resources :teachers do
    get :subjects
  end
  get 'report_subjects' => 'reports#subjects'
end
