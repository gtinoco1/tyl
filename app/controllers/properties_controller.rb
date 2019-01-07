class PropertiesController < ApplicationController
  def index
    @properties = Property.where(status: "Active")

    render("property_templates/index.html.erb")
  end

  def show
    @property = Property.find(params.fetch("id_to_display"))

    render("property_templates/show.html.erb")
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

    if @property.valid?
      @property.save

      redirect_back(:fallback_location => "/properties", :notice => "Property created successfully.")
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

    redirect_to("/properties", :notice => "Property deleted successfully.")
  end
end
