class PropertiesController < ApplicationController
  def index
    render("property_templates/index.html.erb")
  end

  def all
    @properties_active = current_user.properties.where(status: "Active")

    render("property_templates/all_properties.html.erb")
  end

  def show
    @property = Property.find(params.fetch("id_to_display"))

    render("property_templates/show.html.erb")
  end

  def archive
    @properties = Property.all
    render("property_templates/archive.html.erb")
  end

  # def report_html
  #   @property = Property.find(params.fetch("id_to_display"))
  #   @call_type = ActivityType.where(title: "Call").first
  #   render("property_templates/report_html.html.erb")
  # end
  
  def report_settings
    @property = Property.find(params.fetch("id_to_display"))

    render("property_templates/report_generator.html.erb")
  end

  def create_pdf
    @property = Property.find(params.fetch("id_to_display"))
    @current_user = current_user
    @start_date = Date.strptime(params.fetch("start_date"), "%Y-%m-%d")
    @end_date = Date.strptime(params.fetch("end_date"), "%Y-%m-%d")

    respond_to do |format|
      format.html
      # format.csv {render text: Property.all.to_csv}
      format.xls { send_data Property.all.to_csv(col_sep: "\t") }

      format.pdf do
        pdf = ReportTwoPdf.new(@property, @current_user, @start_date, @end_date)
        send_data pdf.render, :filename => "Report: #{@property.address}.pdf", :type => "application/pdf", disposition: "inline"
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

      redirect_to("/all_properties", :notice => "Property created successfully.")
    else
      render("property_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @property = Property.find(params.fetch("prefill_with_id"))

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

    @property.destroy

    redirect_to("/all_properties", :notice => "Property deleted successfully.")
  end
  
  def my_account
    render("users/my_account.html.erb")
  end
  
  def prices
    @property = Property.find(params.fetch("id_to_display"))

    render("property_templates/property_prices.html.erb")
  end
end
