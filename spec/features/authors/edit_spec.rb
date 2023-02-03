require 'rails_helper'

describe 'author edit' do
  before :each do
    @author = Author.create!(name: 'Mary Shelley', year_born: 1797, alive: false)
  end

  it 'can submit a form' do
    visit "/authors/#{@author.id}/edit"
    fill_in 'author[name]', with: 'Frankenstein\'s Monster'
    choose('Alive')
    fill_in 'author[year_born]', with: 1818
    click_button "submit"
    expect(current_path).to eq("/authors/#{@author.id}")
    expect(page).to have_content('Frankenstein\'s Monster')
    expect(page).to have_content('Year Born: 1818')
    expect(page).to have_content('Alive?: true')  
  end
end

