class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    render("activity_templates/index.html.erb")
  end

  def show
    @activity = Activity.find(params.fetch("id_to_display"))
    
    render("activity_templates/show.html.erb")
  end

  def new_form
    @activity = Activity.new
    @property_id = params.fetch("id_of_property")

    render("activity_templates/new_form.html.erb")
  end

  def create_row
    @activity = Activity.new

    @activity.activity_type_id = params.fetch("activity_type_id")
    @activity.date = params.fetch("date")
    @activity.duration = params.fetch("duration","")
    @activity.cost = params.fetch("cost","")
    @activity.property_id = params.fetch("property_id","")
    @activity.detail = params.fetch("detail","")
    @activity.outcome = params.fetch("outcome","")
    @activity.contact = params.fetch("contact","")
    @activity.subject = params.fetch("subject","")
    @activity.flyer_img = params.fetch("flyer_img","")
    @activity.postcard__img = params.fetch("postcard__img","")

    if @activity.valid?
      @activity.save

      redirect_to("/activities/#{@activity.id}/edit/")
    else
      render("activity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @activity = Activity.find(params.fetch("prefill_with_id"))

    render("activity_templates/edit_form.html.erb")
  end

  def update_row
    @activity = Activity.find(params.fetch("id_to_modify"))

    @activity.activity_type_id = params.fetch("activity_type_id","")
    @activity.date = params.fetch("date","")
    @activity.duration = params.fetch("duration","")
    @activity.cost = params.fetch("cost","")
    @activity.property_id = params.fetch("property_id","")
    @activity.detail = params.fetch("detail","")
    @activity.outcome = params.fetch("outcome","")
    @activity.contact = params.fetch("contact","")
    @activity.subject = params.fetch("subject","")
    @activity.flyer_img = params.fetch("flyer_img","")
    @activity.postcard__img = params.fetch("postcard__img","")

    if @activity.valid?
       @activity.save
      
      redirect_to("/properties/#{@activity.property_id}", :notice => "Activity created successfully.")
    else
      render("activity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @activity = Activity.find(params.fetch("id_to_remove"))

    @activity.destroy

      redirect_to("/properties/#{@activity.property_id}", :notice => "Activity deleted successfully.")
  end
end
