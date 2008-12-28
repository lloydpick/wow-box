ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  map.root :controller => "home", :action => "index"

  map.resources :realms

  # Operations
  map.namespace(:admin) do |admin|
    admin.resources :realms
  end

  # Default fall back routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
