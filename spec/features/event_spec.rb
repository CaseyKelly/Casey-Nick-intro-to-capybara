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

end
