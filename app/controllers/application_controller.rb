class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, raise: false

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  before_action :configure_permitted_parameters, if: :devise_controller?

  def contact_list_download
    respond_to do |format|
      format.csv do
        csv = ""
        csv << ["email", "first_name", "last_name", "properties", "activity", "date_of_last_updated_activity", "buyers", "buyers_activities", "date_of_last_buyer_activity"].to_csv
        User.all.each do |user|
          csv << [user.email, user.first_name, user.last_name, user.properties.count, user.properties.joins(:activities).count, user.properties.joins(:activities).order(:updated_at).last.updated_at.strftime("%m/%d/%Y"), user.buyers.count, user.buyer_activities.count, user.buyer_activities.order(:updated_at).last.updated_at.strftime("%m/%d/%Y")].to_csv
        end
        send_data csv, :filename => "users.csv", :type => 'text/csv'
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:first_name, :last_name, :headshot, :phone, :agency, :website])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:first_name, :last_name, :headshot, :phone, :agency, :website])
  end



end
