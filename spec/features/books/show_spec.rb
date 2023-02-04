require 'rails_helper'

describe 'books show' do
  before :each do
    @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    @book = Book.create!(title: 'Outliers', author_id: @author.id, year_written: 2008, fiction: false)
  end
  it 'should have the book with attributes' do
    visit "/books/#{@book.id}"
    expect(page).to have_content(@book.title)
    expect(page).to have_content(@book.author_id)
    expect(page).to have_content(@book.year_written)
    expect(page).to have_content(@book.fiction)
    expect(page).to have_content(@book.created_at)
    expect(page).to have_content(@book.updated_at)
  end

  it 'should have a link to update the book' do
    visit "/books/#{@book.id}"
    expect(page).to have_content('Update Book')
    click_link 'Update Book'
    expect(current_path).to eq("/books/#{@book.id}/edit")
  end
end
