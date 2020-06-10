Rails.application.routes.draw do
  # Routes for the Property attachment resource:

  # CREATE
  get("/property_attachments/new/:id_of_property", { :controller => "property_attachments", :action => "new_form" })
  post("/create_property_attachment", { :controller => "property_attachments", :action => "create_row" })

  # READ
  get("/property_attachments", { :controller => "property_attachments", :action => "index" })
  get("/property_attachments/:id_to_display", { :controller => "property_attachments", :action => "show" })

  # UPDATE
  get("/property_attachments/:prefill_with_id/edit", { :controller => "property_attachments", :action => "edit_form" })
  post("/update_property_attachment/:id_to_modify", { :controller => "property_attachments", :action => "update_row" })

  # DELETE
  get("/delete_property_attachment/:id_to_remove", { :controller => "property_attachments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Price resource:

  # CREATE
  get("/prices/new/:id_of_property", { :controller => "prices", :action => "new_form" })
  post("/create_price", { :controller => "prices", :action => "create_row" })

  # READ
  get("/prices", { :controller => "prices", :action => "index" })
  get("/prices/:id_to_display", { :controller => "prices", :action => "show" })

  # UPDATE
  get("/prices/:prefill_with_id/edit", { :controller => "prices", :action => "edit_form" })
  post("/update_price/:id_to_modify", { :controller => "prices", :action => "update_row" })

  # DELETE
  get("/delete_price/:id_to_remove", { :controller => "prices", :action => "destroy_row" })

  #------------------------------

  # Routes for the Reply resource:

  # CREATE
  get("/replies/new", {:controller => "replies", :action => "new_form"})
  post("/create_reply", {:controller => "replies", :action => "create_row"})

  # READ
  get("/replies", {:controller => "replies", :action => "index"})
  get("/replies/:id_to_display", {:controller => "replies", :action => "show"})

  # UPDATE
  get("/replies/:prefill_with_id/edit", {:controller => "replies", :action => "edit_form"})
  post("/update_reply/:id_to_modify", {:controller => "replies", :action => "update_row"})

  # DELETE
  get("/delete_reply/:id_to_remove", {:controller => "replies", :action => "destroy_row"})

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  get("/likes/new", {:controller => "likes", :action => "new_form"})
  post("/create_like", {:controller => "likes", :action => "create_row"})

  # READ
  get("/likes", {:controller => "likes", :action => "index"})
  get("/likes/:id_to_display", {:controller => "likes", :action => "show"})

  # UPDATE
  get("/likes/:prefill_with_id/edit", {:controller => "likes", :action => "edit_form"})
  post("/update_like/:id_to_modify", {:controller => "likes", :action => "update_row"})

  # DELETE
  post("/delete_like/:id_to_remove", {:controller => "likes", :action => "destroy_row"})

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  get("/comments/new", {:controller => "comments", :action => "new_form"})
  post("/create_comment", {:controller => "comments", :action => "create_row"})

  # READ
  get("/comments", {:controller => "comments", :action => "index"})
  get("/comments/:id_to_display", {:controller => "comments", :action => "show"})

  # UPDATE
  get("/comments/:prefill_with_id/edit", {:controller => "comments", :action => "edit_form"})
  post("/update_comment/:id_to_modify", {:controller => "comments", :action => "update_row"})

  # DELETE
  get("/delete_comment/:id_to_remove", {:controller => "comments", :action => "destroy_row"})

  #------------------------------

  # Routes for the Buyer activity type resource:

  # CREATE
  get("/buyer_activity_types/new", {:controller => "buyer_activity_types", :action => "new_form"})
  post("/create_buyer_activity_type", {:controller => "buyer_activity_types", :action => "create_row"})

  # READ
  get("/buyer_activity_types", {:controller => "buyer_activity_types", :action => "index"})
  get("/buyer_activity_types/:id_to_display", {:controller => "buyer_activity_types", :action => "show"})

  # UPDATE
  get("/buyer_activity_types/:prefill_with_id/edit", {:controller => "buyer_activity_types", :action => "edit_form"})
  post("/update_buyer_activity_type/:id_to_modify", {:controller => "buyer_activity_types", :action => "update_row"})

  # DELETE
  get("/delete_buyer_activity_type/:id_to_remove", {:controller => "buyer_activity_types", :action => "destroy_row"})

  #------------------------------

  # Routes for the Buyer activity resource:

  # CREATE
  get("/buyer_activities/new/:id_of_buyer", {:controller => "buyer_activities", :action => "new_form"})
  post("/create_buyer_activity", {:controller => "buyer_activities", :action => "create_row"})

  # READ
  # get("/buyer_activities", {:controller => "buyer_activities", :action => "index"})
  get("/buyer_activities/:id_to_display", {:controller => "buyer_activities", :action => "show"})

  # UPDATE
  get("/buyer_activities/:prefill_with_id/edit", {:controller => "buyer_activities", :action => "edit_form"})
  post("/update_buyer_activity/:id_to_modify", {:controller => "buyer_activities", :action => "update_row"})

  # DELETE
  get("/delete_buyer_activity/:id_to_remove", {:controller => "buyer_activities", :action => "destroy_row"})

  #------------------------------

  # Routes for the Buyer resource:

  # CREATE
  get("/buyers/new/:customer_type", {:controller => "buyers", :action => "new_form"})
  post("/create_buyer/", {:controller => "buyers", :action => "create_row"})

  # READ
  get("/buyers", {:controller => "buyers", :action => "index"})
  get("/buyers/:id_to_display", {:controller => "buyers", :action => "show"})
  get("/customer_type", {:controller => "buyers", :action => "customer_type"})

  # UPDATE
  get("/buyers/:prefill_with_id/edit", {:controller => "buyers", :action => "edit_form"})
  post("/update_buyer/:id_to_modify", {:controller => "buyers", :action => "update_row"})
  get("/buyers/:id_to_display/report", {:controller => "buyers", :action => "create_pdf"})
  post("/add_buyer_to_archive/:id_to_modify", {:controller => "buyers", :action => "add_buyer_to_archive"})
  post("/restore_buyer_from_archive/:id_to_modify", {:controller => "buyers", :action => "restore_buyer_from_archive"})

  # DELETE
  get("/delete_buyer/:id_to_remove", {:controller => "buyers", :action => "destroy_row"})

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  # Routes for the Activity type resource:

  # update user profile
  post '/update_profile', :to => 'users#update_profile'
  delete '/delete_profile', :to => 'users#delete_profile'
  get '/edit_user_profile', :to => 'users#edit_user_profile'

  # CREATE
  get("/activity_types/new", {:controller => "activity_types", :action => "new_form"})
  post("/create_activity_type", {:controller => "activity_types", :action => "create_row"})

  # READ
  get("/activity_types", {:controller => "activity_types", :action => "index"})
  get("/activity_types/:id_to_display", {:controller => "activity_types", :action => "show"})

  # UPDATE
  get("/activity_types/:prefill_with_id/edit", {:controller => "activity_types", :action => "edit_form"})
  post("/update_activity_type/:id_to_modify", {:controller => "activity_types", :action => "update_row"})

  # DELETE
  get("/delete_activity_type/:id_to_remove", {:controller => "activity_types", :action => "destroy_row"})

  #use Present COlor
  get("/activity_type/use_present_color", {:controller => "activity_types", :action => "use_present_color"})
  get("/activity_type/remove_colors", {:controller => "activity_types", :action => "remove_colors"})
  get("/activity_type/edit_color_code", {:controller => "activity_types", :action => "edit_color_code"})
  post("/activity_type/update_color_code", {:controller => "activity_types", :action => "update_color_code"})
  #------------------------------

  # Routes for the Activity resource:

  # CREATE
  get("/activities/new/:id_of_property", {:controller => "activities", :action => "new_form"})
  post("/create_activity", {:controller => "activities", :action => "create_row"})

  # READ
  # get("/activities", {:controller => "activities", :action => "index"})
  get("/activities/:id_to_display", {:controller => "activities", :action => "show"})

  # UPDATE
  get("/activities/:prefill_with_id/edit", {:controller => "activities", :action => "edit_form"})
  post("/update_activity/:id_to_modify", {:controller => "activities", :action => "update_row"})

  # DELETE
  get("/delete_activity/:id_to_remove", {:controller => "activities", :action => "destroy_row"})

  #------------------------------

  # Routes for the Property resource:

  root "properties#index"

  # CREATE
  get("/properties/new", {:controller => "properties", :action => "new_form"})
  post("/create_property", {:controller => "properties", :action => "create_row"})

  # READ
  get("/", {:controller => "properties", :action => "index"})
  get("/properties/:id_to_display", {:controller => "properties", :action => "show"})
  get("/search", {:controller => "properties", :action => "search"})
  get("/sort_properties", {:controller => "properties", :action => "sort_properties"})
  get("/sort_properties_activity", {:controller => "properties", :action => "sort_properties_activity"})
  get("/sort_custom_activity", {:controller => "properties", :action => "sort_custom_activity"})
  get("/set_defalt_sort_for_activity", {:controller => "properties", :action => "defalt_sort_for_activity"})
  get("/all_properties", {:controller => "properties", :action => "all"})
  get("/report_type/:id_to_display", {:controller => "properties", :action => "report_type"})
  get("/report_generator_pdf/:id_to_display", {:controller => "properties", :action => "report_generator_pdf"})

  get("/properties/prices/:id_to_display", {:controller => "properties", :action => "prices"})
  get("/properties/:id_to_display/attachments", {:controller => "properties", :action => "attachments"})

  # UPDATE
  get("/properties/:prefill_with_id/edit", {:controller => "properties", :action => "edit_form"})
  post("/update_property/:id_to_modify", {:controller => "properties", :action => "update_row"})

  post("/properties/:id_to_display/report", {:controller => "properties", :action => "create_pdf"})

  get("/properties/:id_to_display/report_spreadsheet", {:controller => "properties", :action => "report_xlsx"})
  post("/add_property_to_archive/:id_to_modify", {:controller => "properties", :action => "add_property_to_archive"})
  post("/restore_property_from_archive/:id_to_modify", {:controller => "properties", :action => "restore_property_from_archive"})

  # DELETE
  get("/delete_property/:id_to_remove", {:controller => "properties", :action => "destroy_row"})

  get("/archive", {:controller => "properties", :action => "archive"})
  #------------------------------
  get("/help", {:controller => "buyers", :action => "help_page"})
  get("/help_home", {:controller => "buyers", :action => "help_home"})
  get("/contact_us", {:controller => "buyers", :action => "contact_us"})
  get("/terms", {:controller => "buyers", :action => "terms"})
  get("/settings", {:controller => "activity_types", :action => "settings"})
  get("/privacy", {:controller => "buyers", :action => "privacy"})
  get("/updates", {:controller => "buyers", :action => "updates"})

  get("/my_account", {:controller => "properties", :action => "my_account"})


  # propertysummary
  post("/properties/summary", {:controller => "properties", :action => "property_summary_update"})

  # devise_for :users
  devise_for :users, :controllers => {registrations: 'registrations'}
  # devise_for :users, :controllers => {:registrations => "my_devise/registrations"}

  as :user do
  get '/my_account', :to => 'devise/registrations#edit', :as => :user_root
  end

  get("/contact_list_download", { :controller => "application", :action => "contact_list_download" })
  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  resource :user, only: [:edit] do
  collection do
    patch 'update_password'
  end
end


  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
