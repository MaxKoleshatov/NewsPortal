# # frozen_string_literal: true

require 'rails_helper'

feature 'The user create comments' do
  describe 'Authenticated user' do
    given!(:user_1) { create(:user) }
    given!(:category_1) {create(:category)}
    given!(:article_1){create(:article, user_id: user_1.id, category_id: category_1.id)}

    scenario 'Authenticated user can create a comment for article ' do

      sign_in(user_1)

      within '.category_select' do
        page.select category_1.title
        click_on "Go"
      end

      click_on article_1.title

      within '.comment' do
        fill_in 'Body', with: 'Some CommentBody'
        click_on "Create comment"
      end      
      expect(page).to have_content 'Some CommentBody'
    end

    scenario 'Authenticated user cant create a comment for misstake ' do
  end
end

#       scenario 'Authenticated user cant create a article for misstake ' do

#         sign_in(user)

#         within '.category_select' do
#           page.select category_1.title
#           click_on "Go"
#         end

#         click_on "Create new article"
#         click_on 'Create'
#         expect(page).to have_content "Title can't be blank"
#     end
#   end

#   describe 'Unregistered user' do
#     given!(:user) { create(:user) }
#     given!(:category_1) {create(:category)}
#     given!(:article){create(:article, user_id: user.id, category_id: category_1.id)}

#     scenario "Unregistered user cant create a new article, but he see all articles" do

#       visit root_path

#       within '.category_select' do
#         page.select category_1.title
#         click_on "Go"
#       end
        
#       expect(page).not_to have_link 'Create new article'
#       expect(page).to have_content article.title
#     end 
#   end
# end