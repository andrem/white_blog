ActionController::Routing::Routes.draw do |map|
  map.resources :posts
  map.root :controller => "site"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
