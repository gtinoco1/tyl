class PropertiesController < ApplicationController

  def index
    render("property_templates/index.html.erb")
  end

  def all
    @properties_active = current_user.properties.where(status: "Active").order(:sort)
    render("property_templates/all_properties.html.erb")
  end

  def show
    @property = Property.find(params.fetch("id_to_display"))

    authorize! :manage, @property
    render("property_templates/show.html.erb")
  end

  def archive
    @properties = Property.all
    render("property_templates/archive.html.erb")
  end

  def report_xlsx
    @property = Property.find(params.fetch("id_to_display"))
    @properties = current_user.properties

    # respond_to do |format|
    #   format.xlsx
    # end

    if @property.prices.count == 0
      redirect_to("/properties/#{@property.id}", :notice => "Make sure your property has a listing price!")
    else
      render xlsx: "Report_#{@property.address}", disposition: "inline", template: "/property_templates/report.xlsx.axlsx"
    end
  end

  def report_type
    @property = Property.find(params.fetch("id_to_display"))
    authorize! :manage, @property
    render("property_templates/report_type.html.erb")
  end

  def report_generator_pdf
    @property = Property.find(params.fetch("id_to_display"))
    authorize! :manage, @property
    render("property_templates/report_generator_pdf.html.erb")
  end

  def create_pdf
    @property = Property.find(params.fetch("id_to_display"))
    @current_user = current_user
    @start_date = Date.strptime(params.fetch("start_date"), "%Y-%m-%d")
    @end_date = Date.strptime(params.fetch("end_date"), "%Y-%m-%d")
    @user = current_user
    @subject_check = params.fetch("subject","")
    @contact_check = params.fetch("contact","")
    @duration_check = params.fetch("duration","")
    @cost_check = params.fetch("cost","")
    @report_type = params.fetch("report_type","")
    @attachment_toggle = params.fetch("attachment_toggle","")
    @show_total_toggle = params.fetch("total_toggle","")
    @show_chart_toggle = params.fetch("chart_toggle","")

    respond_to do |format|
      format.html
      format.pdf do
        if @report_type == "date_asc" || @report_type == "date_desc"
          pdf = ReportByDateHeader.new(@property, @current_user, @start_date, @end_date, @subject_check,
                                    @contact_check, @duration_check, @cost_check, @attachment_toggle, @report_type, @show_total_toggle,@show_chart_toggle)
        elsif @report_type == "activity_type"
          pdf = ReportThreePdf.new(@property, @current_user, @start_date, @end_date)
        end
        send_data pdf.render, :filename => "Report: #{@property.address}.pdf", :type => "application/pdf", :layout => false
      end
    end
  end

  def new_form
    @property = Property.new

    render("property_templates/new_form.html.erb")
  end

  def create_row
    @property = Property.new

    @property.address = params.fetch("address")
    @property.realtor_id = params.fetch("realtor_id")
    @property.city = params.fetch("city")
    @property.state = params.fetch("state")
    @property.zipcode = params.fetch("zipcode")
    @property.status = params.fetch("status")
    @property.listing_type = params.fetch("listing_type", "")

    if @property.valid?
      @property.save
      @property.update(sort: @property.id)
      redirect_to("/all_properties", :notice => "Property created successfully.")
    else
      render("property_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @property = Property.find(params.fetch("prefill_with_id"))
    authorize! :manage, @property
    render("property_templates/edit_form.html.erb")
  end

  def update_row
    @property = Property.find(params.fetch("id_to_modify"))
    @property.address = params.fetch("address")
    @property.realtor_id = params.fetch("realtor_id")
    @property.city = params.fetch("city")
    @property.state = params.fetch("state")
    @property.zipcode = params.fetch("zipcode")
    @property.status = params.fetch("status")
    @property.listing_type = params.fetch("listing_type")

    if @property.valid?
      @property.save

      redirect_to("/properties/#{@property.id}", :notice => "Property updated successfully.")
    else
      render("property_templates/edit_form_with_errors.html.erb")
    end
  end

  def add_property_to_archive
    @property = Property.find(params.fetch("id_to_modify"))
    @property.address = params.fetch("address")
    @property.realtor_id = params.fetch("realtor_id")
    @property.city = params.fetch("city")
    @property.state = params.fetch("state")
    @property.zipcode = params.fetch("zipcode")
    @property.status = params.fetch("status")
    @property.listing_type = params.fetch("listing_type")

    if @property.valid?
      @property.save

      redirect_to("/archive", :notice => "Property moved to archive.")
    else
      render("property_templates/edit_form_with_errors.html.erb")
    end
  end

  def restore_property_from_archive
    @property = Property.find(params.fetch("id_to_modify"))

    @property.address = params.fetch("address")
    @property.realtor_id = params.fetch("realtor_id")
    @property.city = params.fetch("city")
    @property.state = params.fetch("state")
    @property.zipcode = params.fetch("zipcode")
    @property.status = params.fetch("status")
    @property.listing_type = params.fetch("listing_type")

    if @property.valid?
      @property.save

      redirect_to("/all_properties", :notice => "Property restored successfully.")
    else
      render("property_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @property = Property.find(params.fetch("id_to_remove"))
    authorize! :manage, @property
    @property.destroy

    redirect_to("/all_properties", :notice => "Property deleted successfully.")
  end

  def my_account
    render("users/my_account.html.erb")
  end

  def prices
    @property = Property.find(params.fetch("id_to_display"))
    authorize! :manage, @property
    render("property_templates/property_prices.html.erb")
  end

  def attachments
    @property = Property.find(params.fetch("id_to_display"))
    authorize! :manage, @property
    render("property_templates/property_attachments.html.erb")
  end

  def search
    @parameter = params[:keyword]
    @search = current_user.properties.where("lower(address) LIKE :search", search: "%#{@parameter}%").order(:sort)
    respond_to do |format|
      format.js { render "property_templates/search.js.erb" }
    end
  end
end
