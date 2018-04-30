Rails.application.routes.draw do
  root 'classes#index'

  post 'class' => 'classes#create'
  get 'class/:sid' => 'classes#show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
