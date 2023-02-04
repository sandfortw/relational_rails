# frozen_string_literal: true

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
    expect(@author2.name).to appear_before(@author.name)
  end

  it 'should have a link called "New Author" that redirects when I click' do
    visit '/authors'
    expect(page).to have_content('New Author')
    click_link('New Author')
    expect(current_path).to eq('/authors/new')
  end
end
