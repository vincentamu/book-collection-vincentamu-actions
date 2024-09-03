# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Managing books', type: :feature do
  scenario 'creating a book with valid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
    fill_in 'book[author]', with: 'J.K. Rowling'
    fill_in 'book[price]', with: '19.99'
    
    # Selecting the date using select
    select '1997', from: 'book_published_date_1i' # Year
    select 'June', from: 'book_published_date_2i' # Month
    select '26', from: 'book_published_date_3i' # Day

    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
  end

  scenario 'creating a book with missing inputs' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
    fill_in 'book[author]', with: '' # Leaving author blank
    fill_in 'book[price]', with: '19.99'
    select '1997', from: 'book_published_date_1i'
    select 'June', from: 'book_published_date_2i'
    select '26', from: 'book_published_date_3i'
  
    click_on 'Create Book'
  
    expect(page).to have_content("")
  end
  
end
