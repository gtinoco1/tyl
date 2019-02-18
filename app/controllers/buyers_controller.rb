class BuyersController < ApplicationController
  def index
    @buyers = Buyer.all

    render("buyer_templates/index.html.erb")
  end

  def show
    @buyer = Buyer.find(params.fetch("id_to_display"))

    render("buyer_templates/show.html.erb")
  end
  
  def help_page
    @buyer = Buyer.all
    render("shared/help_page.html.erb")
  end

  def new_form
    @buyer = Buyer.new

    render("buyer_templates/new_form.html.erb")
  end

  def create_row
    @buyer = Buyer.new

    @buyer.user_id = params.fetch("user_id")
    @buyer.name = params.fetch("name")
    @buyer.funds = params.fetch("funds")
    @buyer.downpayment = params.fetch("downpayment")
    @buyer.preapproval = params.fetch("preapproval")

    if @buyer.valid?
      @buyer.save
       redirect_to("/buyers", :notice => "Buyer updated successfully.")
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
    @buyer.funds = params.fetch("funds")
    @buyer.downpayment = params.fetch("downpayment")
    @buyer.preapproval = params.fetch("preapproval")

    if @buyer.valid?
      @buyer.save

      redirect_to("/buyers/#{@buyer.id}", :notice => "Buyer updated successfully.")
    else
      render("buyer_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @buyer = Buyer.find(params.fetch("id_to_remove"))

    @buyer.destroy

    redirect_to("/buyers", :notice => "Buyer deleted successfully.")
  end
end
