require 'rails_helper'

# User Story 11, Parent Creation 
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
describe 'new author page' do
  it 'can submit the form for a new author' do
    visit '/authors/new'
    fill_in 'author[name]', with: 'Kazuo Ishiguro'
    choose('Alive')
    fill_in 'author[year_born]', with: 1954
    click_button "Create Author"
    expect(current_path).to eq('/authors')
    expect(page).to have_content('Name: Kazuo Ishiguro')
    expect(page).to have_content('Year Born: 1954')
    expect(page).to have_content('Alive?: true')
  end
end


# it "signs me in" do
#   visit '/sessions/new'
  # within("#session") do
  #   fill_in 'Email', with: 'user@example.com'
  #   fill_in 'Password', with: 'password'
  # end
#   click_button 'Sign in'
#   expect(page).to have_content 'Success'
# end