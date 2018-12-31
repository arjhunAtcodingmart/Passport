Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :passport_form
  resources :view_form_details
  post '/applicant_detail' => 'passport_form#applicant_detail'
  delete '/view_form/:id' => 'view_form_details#destroy'
  get '/view_form' => 'view_form_details#index'
  root 'passport_form#index'
end
