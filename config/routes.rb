Rails.application.routes.draw do
  get 'authentication/new'
  get 'authentication/create'
  get 'authentication/destroy'
  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
end

