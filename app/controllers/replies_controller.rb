class RepliesController < ApplicationController
  def index
    @replies = Reply.all

    render("reply_templates/index.html.erb")
  end

  def show
    @reply = Reply.find(params.fetch("id_to_display"))

    render("reply_templates/show.html.erb")
  end

  def new_form
    @reply = Reply.new

    render("reply_templates/new_form.html.erb")
  end

  def create_row
    @reply = Reply.new

    @reply.comment_id = params.fetch("comment_id")
    @reply.user_id = params.fetch("user_id")
    @reply.body = params.fetch("body")

    if @reply.valid?
      @reply.save

      redirect_back(:fallback_location => "/replies", :notice => "Reply created successfully.")
    else
      render("reply_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @reply = Reply.find(params.fetch("prefill_with_id"))

    render("reply_templates/edit_form.html.erb")
  end

  def update_row
    @reply = Reply.find(params.fetch("id_to_modify"))

    @reply.comment_id = params.fetch("comment_id")
    @reply.user_id = params.fetch("user_id")
    @reply.body = params.fetch("body")

    if @reply.valid?
      @reply.save

      redirect_to("/replies/#{@reply.id}", :notice => "Reply updated successfully.")
    else
      render("reply_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @reply = Reply.find(params.fetch("id_to_remove"))

    @reply.destroy

    redirect_to("/replies", :notice => "Reply deleted successfully.")
  end
end
