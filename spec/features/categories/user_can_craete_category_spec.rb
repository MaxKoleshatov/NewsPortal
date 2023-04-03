# frozen_string_literal: true

require 'rails_helper'

feature 'The user can create category' do
  describe 'Authenticated user' do
    given(:user) { create(:user) }
    given!(:category_1) {create(:category)}
    # given!(:article){create(:article, category_id: category_1.id)}

    scenario 'Authenticated user can create a new category and see all categories ' do
      sign_in(user)

      click_on "All categories"
      click_on "Create New Category"
    
      fill_in 'Title', with: 'Some CategoryTitle'
      click_on 'Create'

      expect(page).to have_content 'Some CategoryTitle'
      expect(page).to have_content category_1.title

    end

    scenario "Authenticated user try create a new category for misstake" do
      sign_in(user)

      click_on "All categories"
      click_on "Create New Category"
      
      click_on 'Create'
    #   save_and_open_page

      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Create new Category"
    end
  end
  describe 'Unregistered user' do
    given!(:category_2) {create(:category, title: "TilteCategory_2")}
    scenario "Unregistered user cant create a new category, but he see all categories" do
        visit root_path

        click_on "All categories"
          
        expect(page).not_to have_link 'Create New Category'
        expect(page).to have_content category_2.title  
    end

  end  
end