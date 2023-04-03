# frozen_string_literal: true

require 'rails_helper'

feature 'The user can create category' do
  describe 'Authenticated user' do
    given(:user) { create(:user) }
    given!(:category_1) {create(:category, title: "Sport")}
    given!(:category_2) {create(:category, title: "Politic")}
    # given!(:article){create(:article, category_id: category_1.id)}

    scenario "Authenticated user can choise category" do
      sign_in(user)

      within '.category_select' do
        page.select category_1.title
        click_on "Go"
      end

      expect(page).to have_content "Sport"
      expect(page).not_to have_content "Politic"
    end

    scenario 'Authenticated user dont choice category, but click go ' do
      sign_in(user)
      click_on "Go"
    
      expect(page).to have_content 'Нужно выбрать категорию'
    end
  end
end