class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/index" })
  end

  def show
    venue_id = params.fetch("path_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.first

    render({ :template => "venue_templates/show" })
  end

  def create
    new_venue = Venue.new
    new_venue.address = params.fetch("query_address")
    new_venue.name = params.fetch("query_name")
    new_venue.neighborhood = params.fetch("query_neighborhood")
  
    new_venue.save

    redirect_to("/venues/#{new_venue.id}")
  end
  
  def update
    the_id = params.fetch("path_id")

    matching_records = Venue.where({ :id => the_id })

    the_venue = matching_records.first
    the_venue.address = params.fetch("query_address")
    the_venue.name = params.fetch("query_name")
    the_venue.neighborhood = params.fetch("query_neighborhood")
    
    the_venue.save
    
    redirect_to("/venues/#{the_venue.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    matching_venues = Venue.where({ :id => the_id })
    the_venue = matching_venues.first
    
    the_venue.destroy
    
    redirect_to("/venues")
  end

end
