class BuyerActivitiesController < ApplicationController
  def index
    @buyer_activities = BuyerActivity.all

    render("buyer_activity_templates/index.html.erb")
  end

  def show
    @buyer_activity = BuyerActivity.find(params.fetch("id_to_display"))
    @buyer = Buyer.find_by(id: @buyer_activity.buyer_id)
    authorize! :manage, @buyer
    render("buyer_activity_templates/show.html.erb")
  end

  def new_form
    @buyer_activity = BuyerActivity.new
    @buyer_id = params.fetch("id_of_buyer")

    render("buyer_activity_templates/new_form.html.erb")
  end

  def create_row
    @buyer_activity = BuyerActivity.new

    @buyer_activity.duration = params[:buyer_activity][:duration]
    @buyer_activity.property_address = params[:buyer_activity][:property_address]
    @buyer_activity.zipcode = params[:buyer_activity][:zipcode]
    @buyer_activity.detail = params[:buyer_activity][:detail]
    @buyer_activity.comment = params[:buyer_activity][:comment]
    # @buyer_activity.image = params[:buyer_activity][:image]
    @buyer_activity.buyer_id = params[:buyer_activity][:buyer_id]
    @buyer_activity.buyer_activity_type_id = params.fetch("buyer_activity_type_id", "")
    @buyer_activity.date = params[:buyer_activity][:date]
    @buyer_activity.subject = params[:buyer_activity][:subject]
    @buyer_activity.agent = params[:buyer_activity][:agent]
    @buyer_activity.city = params[:buyer_activity][:city]
    @buyer_activity.state = params[:buyer_activity][:state]

    if @buyer_activity.valid?
      @buyer_activity.save

      redirect_to("/buyers/#{@buyer_activity.buyer_id}", :notice => "Activity created successfully.")
    else
      render("buyer_activity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @buyer_activity = BuyerActivity.find(params.fetch("prefill_with_id"))
    @buyer = Buyer.find_by(id: @buyer_activity.buyer_id)
    authorize! :manage, @buyer
    render("buyer_activity_templates/edit_form.html.erb")
  end

  def update_row
    @buyer_activity = BuyerActivity.find(params.fetch("id_to_modify"))

    @buyer_activity.duration = params.fetch("duration", "")
    @buyer_activity.property_address = params.fetch("property_address", "")
    @buyer_activity.zipcode = params.fetch("zipcode", "")
    @buyer_activity.detail = params.fetch("detail", "")
    @buyer_activity.comment = params.fetch("comment", "")
    @buyer_activity.image = params.fetch("image", "")
    @buyer_activity.buyer_id = params.fetch("buyer_id", "")
    @buyer_activity.buyer_activity_type_id = params.fetch("buyer_activity_type_id", "")
    @buyer_activity.date = params.fetch("date", "")
    @buyer_activity.subject = params.fetch("subject", "")
    @buyer_activity.agent = params.fetch("agent", "")
    @buyer_activity.city = params.fetch("city", "")
    @buyer_activity.state = params.fetch("state", "")

    if @buyer_activity.valid?
      @buyer_activity.save

      redirect_to("/buyers/#{@buyer_activity.buyer_id}", :notice => "Activity created successfully.")
    else
      render("buyer_activity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @buyer_activity = BuyerActivity.find(params.fetch("id_to_remove"))
    @buyer = Buyer.find_by(id: @buyer_activity.buyer_id)
    authorize! :manage, @buyer
    @buyer_activity.destroy

    redirect_to("/buyers/#{@buyer_activity.buyer_id}", :notice => "Activity deleted successfully.")
  end
end
