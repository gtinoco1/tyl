class ActivityTypesController < ApplicationController
  def index
    @activity_types = ActivityType.all
    @activity_type = ActivityType.new

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
    @from = 'activity_type'
    respond_to do |format|
      # format.html {render "activity_type_templates/new_form.html.erb" }
      format.js { render "activity_type_templates/new_form.js.erb" }
    end
    # render("activity_type_templates/new_form.html.erb")
  end

  def create_row
    @activity_type = ActivityType.new

    @activity_type.title = params[:activity_type][:title]
    @activity_type.color_code = params[:activity_type][:color_code]
    @activity_type.cost_toggle = params[:activity_type][:cost_toggle]
    @activity_type.duration_toggle = params[:activity_type][:duration_toggle]
    @activity_type.detail_toggle = params[:activity_type][:detail_toggle]
    @activity_type.outcome_toggle = params[:activity_type][:outcome_toggle]
    @activity_type.contact_toggle = params[:activity_type][:contact_toggle]
    @activity_type.subject_toggle = params[:activity_type][:subject_toggle]
    @activity_type.agent_toggle = params[:activity_type][:agent_toggle]
    @activity_type.customer_toggle = params[:activity_type][:customer_toggle]
    @activity_type.user_id = params[:activity_type][:user_id]
    @from = params[:activity_type][:from] if params[:activity_type][:from].present?

    if @activity_type.valid?
      @activity_type.save
      if(@from.present? and @from == 'activity_type')
        redirect_to("/activity_types", :notice => "Activity type created successfully.")
      else
        @property_id = @from.split("_")[1]
        @activity = Activity.new
        @activity_type = ActivityType.new
        render("/activity_templates/new_form.html.erb", :notice => "Activity type created successfully.")
      end
    else
      # render("activity_type_templates/new_form_with_errors.html.erb")
      render("activity_type_templates/index.html.erb")
    end
  end

  def edit_form
    @activity_type = ActivityType.find(params.fetch("prefill_with_id"))
    respond_to do |format|
      format.js { render "activity_type_templates/edit_form.js.erb" }
    end
    # render("activity_type_templates/edit_form.html.erb")
  end

  def update_row
    @activity_type = ActivityType.find(params.fetch("id_to_modify"))

    @activity_type.title = params[:activity_type][:title]
    @activity_type.color_code = params[:activity_type][:color_code]
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
      render("activity_type_templates/index.html.erb")
    end
  end

  def destroy_row
    @activity_type = ActivityType.find(params.fetch("id_to_remove"))
    @activity_type.destroy
    redirect_to("/activity_types", :notice => "Activity type deleted successfully.")
  end

  def use_present_color
    current_user.activity_types.active.order(created_at: :desc).each_with_index do |type, index|
      if index >= ActivityType.colors.size
        type.update(color_code: ActivityType.colors[index - ActivityType.colors.size])
      else
        type.update(color_code: ActivityType.colors[index])
      end
    end
    redirect_to("/activity_types", :notice => "Used present colors")
  end

  def remove_colors
    current_user.activity_types.order(created_at: :desc).each_with_index do |type, index|
      type.update(color_code: '#fff')
    end
    redirect_to("/activity_types", :notice => "Remove all present colors")
  end

  def edit_color_code
    @activity_type = ActivityType.find(params.fetch("prefill_with_id"))
    respond_to do |format|
      format.js { render "activity_type_templates/edit_color_code.js.erb" }
    end
  end

  def update_color_code
    @activity_type = ActivityType.find(params.fetch("prefill_with_id"))
    @activity_type.color_code = params[:color_code]
    @activity_type.save
    redirect_to("/activity_types", :notice => "Color code updated successfully")
  end

  def archive_activity_type
    @activity_type = ActivityType.find(params.fetch("prefill_with_id"))
    @activity_type.status = 'archive'
    @activity_type.save
    redirect_to("/activity_types", :notice => "Color code updated successfully")
  end
end
