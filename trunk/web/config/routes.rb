ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  map.root :controller => "home", :action => "index"

  map.resources :realms do |realms|
    realms.resources :guilds
  end

  # Operations
  map.namespace(:admin) do |admin|
    admin.resources :realms
  end

  # Default fall back routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
