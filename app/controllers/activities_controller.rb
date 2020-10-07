class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    render("activity_templates/index.html.erb")
  end

  def show
    @activity = Activity.find(params.fetch("id_to_display"))
    @property = Property.find_by(id: @activity.property_id)
    authorize! :manage, @property, @activity
    render("activity_templates/show.html.erb")
  end

  def new_form
    @activity = Activity.new
    @property_id = params.fetch("id_of_property")
    @activity_type = ActivityType.new
    render("activity_templates/new_form.html.erb")
  end

  def create_row

    @activity = Activity.new

    @activity.activity_type_id = params.fetch("activity_type_id")
    @activity.date = params[:activity][:date]
    @activity.duration = params[:activity][:duration]
    @activity.cost = params[:activity][:cost]
    @activity.property_id = params[:activity][:property_id]
    @activity.detail = params.fetch("detail","")
    @activity.outcome = params.fetch("outcome","")
    @activity.contact = params[:activity][:contact]
    @activity.subject = params[:activity][:subject]
    @activity.agent = params.fetch("agent","")
    @activity.customer = params.fetch("customer","")
    if @activity.valid?
      @activity.save
      @activity.update(sort: @activity.id)
      redirect_to("/properties/#{@activity.property_id}")
    else
      # redirect_to("/activities/new/#{@activity.property_id}", :notice => "*Required Field")
      @property_id = @activity.property_id
      render("activity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @activity = Activity.find(params.fetch("prefill_with_id"))
    @property = Property.find_by(id: @activity.property_id)
    authorize! :manage, @property, @activity
    render("activity_templates/edit_form.html.erb")
  end

  def update_row
    @activity = Activity.find(params.fetch("id_to_modify"))

    @activity.activity_type_id = params.fetch("activity_type_id")
    @activity.date = params[:activity][:date]
    @activity.duration = params[:activity][:duration]
    @activity.cost = params[:activity][:cost]
    @activity.property_id = params[:activity][:property_id]
    @activity.detail = params.fetch("detail","")
    @activity.outcome = params.fetch("outcome","")
    @activity.contact = params[:activity][:contact]
    @activity.subject = params[:activity][:subject]
    @activity.agent = params.fetch("agent","")
    @activity.customer = params.fetch("customer","")

    if @activity.valid?
      @activity.save

      redirect_to("/properties/#{@activity.property_id}", :notice => "Activity created successfully.")
    else
      render("activity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @activity = Activity.find(params.fetch("id_to_remove"))
    @property = Property.find_by(id: @activity.property_id)
    authorize! :manage, @property, @activity
    @activity.destroy

    redirect_to("/properties/#{@activity.property_id}", :notice => "Activity deleted successfully.")
  end
end
