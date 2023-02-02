# [ ] done

# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require 'rails_helper'


describe 'the author index page' do
  before :each do
    @author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
    @author2 = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
  end
  it 'should display the name of each parent record in the system' do
    visit '/authors'
    expect(page).to have_content(@author.name)
    expect(page).to have_content(@author2.name)
  end

  it 'should be ordered by most recently created record' do
    visit '/authors'
    save_and_open_page
    # expect(page).to =~ /#{@author2.name}.*#{@author.name}/
  end
end