class ActivityTypesController < ApplicationController
  def index
    @activity_types = ActivityType.all

    render("activity_type_templates/index.html.erb")
  end

  def show
    @activity_type = ActivityType.find(params.fetch("id_to_display"))

    render("activity_type_templates/show.html.erb")
  end

    def settings
    @activity_type = ActivityType.all

    render("shared/settings.html.erb")
  end

  def new_form
    @activity_type = ActivityType.new

    render("activity_type_templates/new_form.html.erb")
  end

  def create_row
    @activity_type = ActivityType.new

    @activity_type.title = params[:activity_type][:title]
    @activity_type.cost_toggle = params[:activity_type][:cost_toggle]
    @activity_type.duration_toggle = params[:activity_type][:duration_toggle]
    @activity_type.detail_toggle = params[:activity_type][:detail_toggle]
    @activity_type.outcome_toggle = params[:activity_type][:outcome_toggle]
    @activity_type.contact_toggle = params[:activity_type][:contact_toggle]
    @activity_type.subject_toggle = params[:activity_type][:subject_toggle]
    @activity_type.agent_toggle = params[:activity_type][:agent_toggle]
    @activity_type.customer_toggle = params[:activity_type][:customer_toggle]
    @activity_type.user_id = params[:activity_type][:user_id]

    if @activity_type.valid?
      @activity_type.save

      redirect_to("/all_properties", :notice => "Activity type created successfully.")
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

    @activity_type.title = params[:activity_type][:title]
    @activity_type.cost_toggle = params[:activity_type][:cost_toggle]
    @activity_type.duration_toggle = params[:activity_type][:duration_toggle]
    @activity_type.detail_toggle = params[:activity_type][:detail_toggle]
    @activity_type.outcome_toggle = params[:activity_type][:outcome_toggle]
    @activity_type.contact_toggle = params[:activity_type][:contact_toggle]
    @activity_type.subject_toggle = params[:activity_type][:subject_toggle]
    @activity_type.agent_toggle = params[:activity_type][:agent_toggle]
    @activity_type.customer_toggle = params[:activity_type][:customer_toggle]
    @activity_type.user_id = params[:activity_type][:user_id]

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
