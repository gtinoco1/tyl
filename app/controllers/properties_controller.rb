class PropertiesController < ApplicationController
  def index
    @properties = Property.where(status: "Active")

    render("property_templates/index.html.erb")
  end
  
    def all
    @properties = Property.where(status: "Active")

    render("property_templates/all_properties.html.erb")
  end

  def show
    @property = Property.find(params.fetch("id_to_display"))

    render("property_templates/show.html.erb")
  end
  
  # def report_html
  #   @property = Property.find(params.fetch("id_to_display"))
  #   @call_type = ActivityType.where(title: "Call").first
  #   render("property_templates/report_html.html.erb")
  # end
  
    def create_pdf
    @property = Property.find(params.fetch("id_to_display"))
    @activity_types = current_user.activity_types
    @current_user_id = current_user.id
    
    respond_to do |format|
      format.html
      # format.csv {render text: Property.all.to_csv}
      format.xls { send_data Property.all.to_csv(col_sep: "\t") }
      
      format.pdf do
        pdf = ReportTwoPdf.new(@property, @activity_types, @current_user)
        send_data pdf.render, :filename => "Report: #{@property.address}.pdf", :type => "application/pdf", disposition: 'inline'
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
    @property.listing_type = params.fetch("listing_type","")

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

  def destroy_row
    @property = Property.find(params.fetch("id_to_remove"))

    @property.destroy

    redirect_to("/all_properties", :notice => "Property deleted successfully.")
  end
end
