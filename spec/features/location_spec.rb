require 'rails_helper'


describe 'User can CRUD locations' do

  scenario 'User can create a Location' do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Galvanize"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"


    #now we expect the index page to have the name of the location we created.
    expect(page).to have_content("Galvanize")
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")
  end

  scenario 'User can view a show page for a location' do
    visit '/'
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Hot Dog"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"
    expect(page).to have_content("Hot Dog")
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")
    click_on "Hot Dog"
    expect(page).to have_content("Hot Dog")
    expect(page).to have_content("New Address")
    expect(page).to have_content("90210")

  end

  scenario 'User can edit a location' do
    visit '/'
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Hot Dog"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"
    expect(page).to have_content("Hot Dog")
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")
    click_on 'Edit'
    click_on 'Update Location'
    expect(page).to have_content("Location was successfully updated")
  end


  scenario 'User can delete a location' do
    #fill in
  end






end
