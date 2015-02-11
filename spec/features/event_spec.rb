require 'rails_helper'


describe 'User can CRUD events' do

  scenario 'User can create an Event' do

    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Galvanize"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"

    click_on "Add Event"
    fill_in 'event[description]', :with => "stuff"
    fill_in 'event[date]', :with => "08022015"
    click_on "Create Event"
    expect(page).to have_content("Event was successfully created.")
  end

  scenario 'User can see event show page' do

    # click on link to go to new location form
    @location = Location.create(name: "Galvanize", address:"new address", zipcode:"90210")

    @event = Event.create(location_id: @location.id, description: "stuff", date: "08082015", requires_id: false)

    visit "/locations/#{@location.id}/events/#{@event.id}"

    expect(page).to have_content('false')
  end

  scenario 'User can edit an event' do

    @location = Location.create(name: "Galvanize", address:"new address", zipcode:"90210")

    @event = Event.create(location_id: @location.id, description: "stuff", date: "08082015", requires_id: false)

    visit "/locations/#{@location.id}/events/#{@event.id}"

    click_on "Edit Event"
    click_on "Update Event"
    expect(page).to have_content("Event was successfully updated")
  end




end
