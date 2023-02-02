# [ ] done

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)
require 'rails_helper'

describe 'author show page' do
  it 'should show the author with the correct id and attributes' do
    author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
    visit "/authors/#{author.id}"
    expect(page).to have_content(author.name)
    expect(page).to have_content(author.year_born)
    expect(page).to have_content(author.alive)
    expect(page).to have_content(author.created_at)
    expect(page).to have_content(author.updated_at)
  end

  it 'should have a count of the number of children' do
    author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
    book = Book.create!(title:'Outliers', author_id: author.id, year_written: 2008, fiction: false)
    book1 = Book.create!(title:'Something book', author_id: author.id, year_written: 2008, fiction: false)
    visit "/authors/#{author.id}"
    expect(page).to have_content("Book count: 2")
  end
end
