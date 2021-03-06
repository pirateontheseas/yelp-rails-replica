Rails.application.routes.draw do

  match("/cuisines", { :controller => "application", :action => "cuisinehuh", :via => "get" })

  match("/dishes", { :controller => "application", :action => "disheshuh", :via => "get" })
  
  match("/dishes/:dishid", { :controller => "application", :action => "disheswot", :via => "get" })
  
  match("/neighborhoods", { :controller => "application", :action => "neighborwhere", :via => "get" })
  
  match("/venues", { :controller => "application", :action => "venuewot", :via => "get" })

  match("/users", { :controller => "application", :action => "userwot", :via => "get" })

  match("/venues/:venueid", { :controller => "application", :action => "venuehuh", :via => "get" })
  
  match("/users/:userid", { :controller => "application", :action => "userhuh", :via => "get" })

  match("/add_bookmark", { :controller => "application", :action => "addbookmark", :via => "get" })
  
  match("/users/:userid/bookmarks", { :controller => "application", :action => "userbookmark", :via => "get" })
  
  match("/dishes/:dishid/bookmarks", { :controller => "application", :action => "dishbookmark", :via => "get" })
  
  match("/venues/:venueid/bookmarks", { :controller => "application", :action => "venuebookmark", :via => "get" })

  match("/remove_bookmark/:bookmarkid", { :controller => "application", :action => "nawbookmark", :via => "get" })
  
  match("/users/:userid/bookmarked_dishes", { :controller => "application", :action => "userdish", :via => "get" })
  
  match("/dishes/:dishid/experts", { :controller => "application", :action => "dishmaster", :via => "get" })
  
  match("/venues/:venueid/specialties", { :controller => "application", :action => "wottoeat", :via => "get" })
  
  match("venues/:venueid/fans", { :controller => "application", :action => "whoswho", :via => "get" })
  
  
  
  
  # ====================================================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
