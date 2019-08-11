class BuyerActivityTypesController < ApplicationController
  def index
    @buyer_activity_types = BuyerActivityType.all

    render("buyer_activity_type_templates/index.html.erb")
  end

  def show
    @buyer_activity_type = BuyerActivityType.find(params.fetch("id_to_display"))

    render("buyer_activity_type_templates/show.html.erb")
  end

  def new_form
    @buyer_activity_type = BuyerActivityType.new

    render("buyer_activity_type_templates/new_form.html.erb")
  end

  def create_row
    @buyer_activity_type = BuyerActivityType.new

    @buyer_activity_type.user_id = params.fetch("user_id")
    @buyer_activity_type.duration_toggle = params.fetch("duration_toggle")
    @buyer_activity_type.property_address_toggle = params.fetch("property_address_toggle")
    @buyer_activity_type.zipcode_toggle = params.fetch("zipcode_toggle","")
    @buyer_activity_type.detail_toggle = params.fetch("detail_toggle")
    @buyer_activity_type.comment_toggle = params.fetch("comment_toggle")
    @buyer_activity_type.image_toggle = params.fetch("image_toggle","")
    @buyer_activity_type.subject_toggle = params.fetch("subject_toggle","")
    @buyer_activity_type.agent_toggle = params.fetch("agent_toggle")
    @buyer_activity_type.title = params.fetch("title")
    @buyer_activity_type.city_toggle = params.fetch("city_toggle","")
    @buyer_activity_type.state_toggle = params.fetch("state_toggle","")

    if @buyer_activity_type.valid?
      @buyer_activity_type.save

      redirect_back fallback_location:  "/buyers"
      # redirect_back("/buyers", :notice => "Type created successfully")
      # redirect_to("/buyer_activity_types", :notice => "Activity type created successfully.")
    else
      render("buyer_activity_type_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @buyer_activity_type = BuyerActivityType.find(params.fetch("prefill_with_id"))

    render("buyer_activity_type_templates/edit_form.html.erb")
  end

  def update_row
    @buyer_activity_type = BuyerActivityType.find(params.fetch("id_to_modify"))

    @buyer_activity_type.user_id = params.fetch("user_id")
    @buyer_activity_type.duration_toggle = params.fetch("duration_toggle")
    @buyer_activity_type.property_address_toggle = params.fetch("property_address_toggle")
    @buyer_activity_type.zipcode_toggle = params.fetch("zipcode_toggle","")
    @buyer_activity_type.detail_toggle = params.fetch("detail_toggle")
    @buyer_activity_type.comment_toggle = params.fetch("comment_toggle")
    @buyer_activity_type.image_toggle = params.fetch("image_toggle")
    @buyer_activity_type.subject_toggle = params.fetch("subject_toggle")
    @buyer_activity_type.agent_toggle = params.fetch("agent_toggle")
    @buyer_activity_type.title = params.fetch("title")
    @buyer_activity_type.city_toggle = params.fetch("city_toggle","")
    @buyer_activity_type.state_toggle = params.fetch("state_toggle","")

    if @buyer_activity_type.valid?
      @buyer_activity_type.save
      redirect_to("/buyer_activity_types", :notice => "Activity updated successfully.")
    else
      render("buyer_activity_type_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @buyer_activity_type = BuyerActivityType.find(params.fetch("id_to_remove"))

    @buyer_activity_type.destroy

    redirect_to("/buyer_activity_types", :notice => "Buyer activity type deleted successfully.")
  end
end
