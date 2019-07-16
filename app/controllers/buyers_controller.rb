class BuyersController < ApplicationController
  def index
    @buyers_active = current_user.buyers.where(status: "Active").or(current_user.buyers.where(status: ""))

    render("buyer_templates/index.html.erb")
  end

  def show
    @buyer = Buyer.find(params.fetch("id_to_display"))

    render("buyer_templates/show.html.erb")
  end
  
  def customer_type
    render("buyer_templates/customer_type.html.erb")
  end

  def create_pdf
    @buyer = Buyer.find(params.fetch("id_to_display"))
    @buyer_activity_types = current_user.buyer_activity_types
    @current_user_id = current_user.id

    respond_to do |format|
      # format.html
      # format.csv {render text: Property.all.to_csv}
      # format.xls { send_data Buyer.all.to_csv(col_sep: "\t") }

      format.pdf do
        pdf = BuyerReportPdf.new(@buyer, @buyer_activity_types, @current_user)
        send_data pdf.render, :filename => "Report: #{@buyer.name}.pdf", :type => "application/pdf", disposition: "inline"
      end
      
    end
  end

  def help_page
    @buyer = Buyer.all
    render("shared/help_page.html.erb")
  end

  def help_home
    @buyer = Buyer.all
    render("shared/help_home.html.erb")
  end

  def contact_us
    @buyer = Buyer.all
    render("shared/contact.html.erb")
  end

  def terms
    @buyer = Buyer.all
    render("shared/terms.html.erb")
  end

  def privacy
    @buyer = Buyer.all
    render("shared/privacy.html.erb")
  end

  def updates
    render("shared/updates.html.erb")
  end

  def new_form
    @buyer = Buyer.new
    @customer_type = params.fetch("customer_type")
    render("buyer_templates/new_form.html.erb")
  end

  def create_row
    @buyer = Buyer.new

    @buyer.user_id = params.fetch("user_id")
    @buyer.name = params.fetch("name")
    @buyer.funds = params.fetch("funds","")
    @buyer.downpayment = params.fetch("downpayment","")
    @buyer.preapproval = params.fetch("preapproval","")
    @buyer.buyer_type = params.fetch("buyer_type")
    @buyer.status = params.fetch("status")
    @buyer.price_min = params.fetch("price_min","")
    @buyer.price_max = params.fetch("price_max","")
    @buyer.bed = params.fetch("bed")
    @buyer.bath = params.fetch("bath")
    @buyer.house = params.fetch("house","")
    @buyer.condo = params.fetch("condo","")
    @buyer.wd = params.fetch("wd","")
    @buyer.balcony = params.fetch("balcony","")
    @buyer.parking = params.fetch("parking","")
    @buyer.garage = params.fetch("garage","")
    @buyer.pool = params.fetch("pool","")
    @buyer.notes = params.fetch("notes","")
    
    if @buyer.valid?
      @buyer.save
      redirect_to("/buyers", :notice => "Customer created successfully.")
    else
      render("buyer_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @buyer = Buyer.find(params.fetch("prefill_with_id"))

    render("buyer_templates/edit_form.html.erb")
  end

  def update_row
    @buyer = Buyer.find(params.fetch("id_to_modify"))

    @buyer.user_id = params.fetch("user_id")
    @buyer.name = params.fetch("name")
    @buyer.funds = params.fetch("funds","")
    @buyer.downpayment = params.fetch("downpayment","")
    @buyer.preapproval = params.fetch("preapproval","")
    @buyer.buyer_type = params.fetch("buyer_type")
    @buyer.status = params.fetch("status")
    @buyer.price_min = params.fetch("price_min","")
    @buyer.price_max = params.fetch("price_max","")
    @buyer.bed = params.fetch("bed")
    @buyer.bath = params.fetch("bath")
    @buyer.house = params.fetch("house","")
    @buyer.condo = params.fetch("condo","")
    @buyer.wd = params.fetch("wd","")
    @buyer.balcony = params.fetch("balcony","")
    @buyer.parking = params.fetch("parking","")
    @buyer.garage = params.fetch("garage","")
    @buyer.pool = params.fetch("pool","")
    @buyer.notes = params.fetch("notes","")

    if @buyer.valid?
      @buyer.save

      redirect_to("/buyers/#{@buyer.id}", :notice => "Customer updated successfully.")
    else
      render("buyer_templates/edit_form_with_errors.html.erb")
    end
  end
  

  def add_buyer_to_archive
    @buyer = Buyer.find(params.fetch("id_to_modify"))
    @buyer.update_attribute(:status, "Archive")

    if @buyer.valid?
      @buyer.save
      redirect_to("/archive", :notice => "Customer moved to archive.")
    else
      render("buyer_templates/edit_form_with_errors.html.erb")
    end
  end

  def restore_buyer_from_archive
    @buyer = Buyer.find(params.fetch("id_to_modify"))
    @buyer.update_attribute(:status, "Active")

    if @buyer.valid?
      @buyer.save
      redirect_to("/buyers", :notice => "Customer restored successfully.")
    else
      render("buyer_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @buyer = Buyer.find(params.fetch("id_to_remove"))

    @buyer.destroy

    redirect_to("/buyers", :notice => "Customer deleted successfully.")
  end
end
