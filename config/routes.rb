Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :browser_history
  root 'browser_history#new'

  get :prev_browser_history, to: 'browser_history#previous'
  get :next_browser_history, to: 'browser_history#next'
end
