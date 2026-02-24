class EntriesController < ApplicationController

  def new
    # find the Place this entry belongs to
    @place = Place.find_by({ "id" => params["place_id"] })
    # render view with new Entry form
  end

  def create
    # start with a new Entry
    @entry = Entry.new
    # assign user-entered form data to Entry's columns
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    # save Entry row
    @entry.save
    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end

end