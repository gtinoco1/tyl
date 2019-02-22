class BuyerActivitiesController < ApplicationController
  def index
    @buyer_activities = BuyerActivity.all

    render("buyer_activity_templates/index.html.erb")
  end

  def show
    @buyer_activity = BuyerActivity.find(params.fetch("id_to_display"))

    render("buyer_activity_templates/show.html.erb")
  end

  def new_form
    @buyer_activity = BuyerActivity.new
    @buyer_id = params.fetch("id_of_buyer")

    render("buyer_activity_templates/new_form.html.erb")
  end

  def create_row
    @buyer_activity = BuyerActivity.new

    @buyer_activity.duration = params.fetch("duration","")
    @buyer_activity.property_address = params.fetch("property_address","")
    @buyer_activity.zipcode = params.fetch("zipcode","")
    @buyer_activity.detail = params.fetch("detail","")
    @buyer_activity.comment = params.fetch("comment","")
    @buyer_activity.image = params.fetch("image","")
    @buyer_activity.buyer_id = params.fetch("buyer_id","")
    @buyer_activity.buyer_activity_type_id = params.fetch("buyer_activity_type_id","")
    @buyer_activity.date = params.fetch("date","")
    @buyer_activity.subject = params.fetch("subject","")
    @buyer_activity.agent = params.fetch("agent","")

    if @buyer_activity.valid?
      @buyer_activity.save

      redirect_to("/buyer_activities/#{@buyer_activity.id}/edit/")
    else
      render("buyer_activity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @buyer_activity = BuyerActivity.find(params.fetch("prefill_with_id"))

    render("buyer_activity_templates/edit_form.html.erb")
  end

  def update_row
    @buyer_activity = BuyerActivity.find(params.fetch("id_to_modify"))

    @buyer_activity.duration = params.fetch("duration","")
    @buyer_activity.property_address = params.fetch("property_address","")
    @buyer_activity.zipcode = params.fetch("zipcode","")
    @buyer_activity.detail = params.fetch("detail","")
    @buyer_activity.comment = params.fetch("comment","")
    @buyer_activity.image = params.fetch("image","")
    @buyer_activity.buyer_id = params.fetch("buyer_id","")
    @buyer_activity.buyer_activity_type_id = params.fetch("buyer_activity_type_id","")
    @buyer_activity.date = params.fetch("date","")
    @buyer_activity.subject = params.fetch("subject","")
    @buyer_activity.agent = params.fetch("agent","")

    if @buyer_activity.valid?
      @buyer_activity.save

      redirect_to("/buyers/#{@buyer_activity.buyer_id}", :notice => "Activity created successfully.")
    else
      render("buyer_activity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @buyer_activity = BuyerActivity.find(params.fetch("id_to_remove"))

    @buyer_activity.destroy

    redirect_to("/buyers/#{@buyer_activity.buyer_id}", :notice => "Activity deleted successfully.")
  end
end
