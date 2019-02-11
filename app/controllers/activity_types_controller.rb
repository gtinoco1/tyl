class ActivityTypesController < ApplicationController
  def index
    @activity_types = ActivityType.all

    render("activity_type_templates/index.html.erb")
  end

  def show
    @activity_type = ActivityType.find(params.fetch("id_to_display"))

    render("activity_type_templates/show.html.erb")
  end

  def new_form
    @activity_type = ActivityType.new

    render("activity_type_templates/new_form.html.erb")
  end

  def create_row
    @activity_type = ActivityType.new

    @activity_type.title = params.fetch("title")
    @activity_type.cost_toggle = params.fetch("cost_toggle")
    @activity_type.duration_toggle = params.fetch("duration_toggle")
    @activity_type.detail_toggle = params.fetch("detail_toggle")
    @activity_type.outcome_toggle = params.fetch("outcome_toggle")
    @activity_type.contact_toggle = params.fetch("contact_toggle")
    @activity_type.flyer_img_toggle = params.fetch("flyer_img_toggle")
    @activity_type.postcard_img_toggle = params.fetch("postcard_img_toggle")
    @activity_type.subject_toggle = params.fetch("subject_toggle")
    @activity_type.agent_toggle = params.fetch("agent_toggle")
    @activity_type.customer_toggle = params.fetch("customer_toggle")
    @activity_type.user_id = params.fetch("user_id")

    if @activity_type.valid?
      @activity_type.save

      redirect_to("/properties", :notice => "Activity type created successfully.")
    else
      render("activity_type_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @activity_type = ActivityType.find(params.fetch("prefill_with_id"))

    render("activity_type_templates/edit_form.html.erb")
  end

  def update_row
    @activity_type = ActivityType.find(params.fetch("id_to_modify"))

    @activity_type.title = params.fetch("title")
    @activity_type.cost_toggle = params.fetch("cost_toggle")
    @activity_type.duration_toggle = params.fetch("duration_toggle")
    @activity_type.detail_toggle = params.fetch("detail_toggle")
    @activity_type.outcome_toggle = params.fetch("outcome_toggle")
    @activity_type.contact_toggle = params.fetch("contact_toggle")
    @activity_type.flyer_img_toggle = params.fetch("flyer_img_toggle")
    @activity_type.postcard_img_toggle = params.fetch("postcard_img_toggle")
    @activity_type.subject_toggle = params.fetch("subject_toggle")
    @activity_type.agent_toggle = params.fetch("agent_toggle")
    @activity_type.customer_toggle = params.fetch("customer_toggle")
    @activity_type.user_id = params.fetch("user_id")

    if @activity_type.valid?
      @activity_type.save

      redirect_to("/activity_types", :notice => "Activity type updated successfully.")
    else
      render("activity_type_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @activity_type = ActivityType.find(params.fetch("id_to_remove"))

    @activity_type.destroy

    redirect_to("/activity_types", :notice => "Activity type deleted successfully.")
  end
end
