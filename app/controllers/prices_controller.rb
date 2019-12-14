class PricesController < ApplicationController
  def index
    @prices = Price.all

    render("price_templates/index.html.erb")
  end

  def show
    @price = Price.find(params.fetch("id_to_display"))

    render("price_templates/show.html.erb")
  end

  def new_form
    @price = Price.new
    @property_id = params.fetch("id_of_property")

    render("price_templates/new_form.html.erb")
  end

  def create_row
    @price = Price.new

    @price.property_id = params.fetch("property_id")
    @price.amount = params.fetch("amount").gsub(/[^\d.]/, "")
    @price.detail = params.fetch("detail")
    @price.date = params.fetch("date")

    if @price.valid?
      @price.save

    redirect_to("/properties/prices/#{@price.property_id}")
    else
      render("price_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @price = Price.find(params.fetch("prefill_with_id"))
    @property = Property.find_by(id: @price.property_id)
    authorize! :manage, @property, @price
    render("price_templates/edit_form.html.erb")
  end

  def update_row
    @price = Price.find(params.fetch("id_to_modify"))

    @price.property_id = params.fetch("property_id")
    @price.amount = params.fetch("amount").gsub(/[^\d.]/, "")
    @price.detail = params.fetch("detail")
    @price.date = params.fetch("date")

    if @price.valid?
      @price.save

    redirect_to("/properties/prices/#{@price.property_id}")
    else
      render("price_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @price = Price.find(params.fetch("id_to_remove"))
    authorize! :manage, @price
    @price.destroy

    redirect_to("/properties/prices/#{@price.property_id}", :notice => "Price deleted successfully.")
  end
end
