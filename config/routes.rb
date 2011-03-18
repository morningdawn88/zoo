Zoo::Application.routes.draw do
  match "pages/login", :via => [:get,:post]
  get "pages/logout"
  root :to => "pages#login"

  get "suggestions/new"
  match "suggestions/create" => "suggestions#create"
  
  get "suggestions/edit"
  match "suggestions/edit" => "suggestions#edit"

  get "suggestions/index"
  match "suggestions/update" => "suggestions#update"
  get "suggestions/chooseSuggestion"
  match "suggestions/chooseSuggestion" => "suggestions#chooseSuggestion"
  
  get "suggestions/index_by_created"
  get "suggestions/index_by_modified"
  get "suggestions/index_by_department"
  get "suggestions/index_by_division"
  get "suggestions/index_by_last_name"

end

