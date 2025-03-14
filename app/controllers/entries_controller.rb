class EntriesController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = current_user.id

    if params[:image].present?
      @entry.image.attach(params[:image])
    end
    
    if @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  else
    render :new
  end
end

private

  def authenticate_user
    unless current_user
      flash[:alert] = "You must be logged in to create an entry."
      redirect_to authentication_new_path  # Redirect to login page if not authenticated
    end
  end
end
