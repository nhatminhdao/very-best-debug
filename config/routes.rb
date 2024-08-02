Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })

  post("/insert_user_record", { :controller => "users", :action => "create" })
  post("/update_user/:username", { :controller => "users", :action => "update" })

  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues/:path_id", { :controller => "venues", :action => "show" })

  post("/insert_venue_record", { :controller => "venues", :action => "create" })
  post("/update_venue/:path_id", { :controller => "venues", :action => "update" })
  get("/delete_venue/:path_id", { :controller => "venues", :action => "destroy" })
  
  post("/insert_comment_record", { :controller => "comments", :action => "create" })
end
