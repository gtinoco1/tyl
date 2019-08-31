class PropertyAttachmentsController < ApplicationController
  def index
    @property_attachments = PropertyAttachment.all

    render("property_attachment_templates/index.html.erb")
  end

  def show
    @property_attachment = PropertyAttachment.find(params.fetch("id_to_display"))
    render("property_attachment_templates/show.html.erb")
  end

  def new_form
    @property_attachment = PropertyAttachment.new
    @property_id = params.fetch("id_of_property")
    render("property_attachment_templates/new_form.html.erb")
  end

  def create_row
    @property_attachment = PropertyAttachment.new

    @property_attachment.property_id = params.fetch("property_id")
    @property_attachment.user_id = params.fetch("user_id")
    @property_attachment.activity_id = params.fetch("activity_id")
    @property_attachment.attachment = params.fetch("attachment", "")
    @property_attachment.title = params.fetch("title")

    if @property_attachment.valid?
      @property_attachment.save

      @property_attachment.pages = @property_attachment.attachment.metadata.fetch("pages", "")
      @property_attachment.save

      redirect_to("/properties/#{@property_attachment.property_id}/attachments", :notice => "Attachment uploaded successfully.")
    else
      redirect_to("/property_attachments/new/#{@property_attachment.property_id}", :notice => "Make sure you have attached an accepted file format.")
    end
  end

  def edit_form
    @property_attachment = PropertyAttachment.find(params.fetch("prefill_with_id"))

    render("property_attachment_templates/edit_form.html.erb")
  end

  def update_row
    @property_attachment = PropertyAttachment.find(params.fetch("id_to_modify"))

    @property_attachment.property_id = params.fetch("property_id")
    @property_attachment.user_id = params.fetch("user_id")
    @property_attachment.activity_id = params.fetch("activity_id")
    @property_attachment.attachment = params.fetch("attachment", "")
    @property_attachment.title = params.fetch("title")

    if @property_attachment.valid?
      @property_attachment.save

      @property_attachment.pages = @property_attachment.attachment.metadata.fetch("pages", "")
      @property_attachment.save

      redirect_to("/property_attachments/#{@property_attachment.id}", :notice => "Property attachment updated successfully.")
    else
      render("property_attachment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @property_attachment = PropertyAttachment.find(params.fetch("id_to_remove"))

    @property_attachment.destroy

    redirect_to("/properties/#{@property_attachment.property_id}/attachments", :notice => "Attachment deleted successfully.")
  end
end
