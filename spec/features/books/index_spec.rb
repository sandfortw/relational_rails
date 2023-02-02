# [ ] done

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

describe 'books index' do

  before :each do
    @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    @book = Book.create!(title:'Outliers', author_id: @author.id, year_written: 2008, fiction: false)
    @author1 = Author.create!(name: 'Someone else', year_born: 1961, alive: true)
    @book1 = Book.create!(title:'Something book', author_id: @author1.id, year_written: 2008, fiction: false)
  end

  it 'should have each book in the database' do
    visit '/books/'
    save_and_open_page
    expect(page).to have_content(@book.title)
    expect(page).to have_content(@book1.title)
  end

  it 'should have the attributes of the book' do
    visit '/books/'
    expect(page).to have_content(@book.title)
    expect(page).to have_content(@book.author_id)
    expect(page).to have_content(@book.year_written)
    expect(page).to have_content(@book.fiction)
  end
end