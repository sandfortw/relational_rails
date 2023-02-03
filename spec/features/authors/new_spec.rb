require 'rails_helper'

# User Story 11, Parent Creation 

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