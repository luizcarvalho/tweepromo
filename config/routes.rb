ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.root :controller => 'sessions', :action => 'home'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.resource :session
  map.oauth_callback '/oauth_callback', :controller => 'sessions', :action => 'oauth_callback'

  map.resource :user
  map.postar "/postar",:controller=>"promoves",:action=>"postar"
  map.seguir "/seguir",:controller=>"promoves",:action=>"seguir"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
