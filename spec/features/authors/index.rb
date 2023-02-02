# [ ] done

# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require 'rails_helper'

describe 'the author index page' do
  it 'should display the name of each parent record in the system' do
    @author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
    @author2 = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    visit '/authors'
    save_and_open_page
    expect(page).to have_content(@author.name)
    expect(page).to have_content(@author2.name)
  end
end