# # frozen_string_literal: true

require 'rails_helper'

feature 'The user can create article' do
  describe 'Create article' do
    given!(:user) { create(:user) }
    given!(:category_1) {create(:category)}
    given!(:article_1){create(:article, title: "1",  user_id: user.id, category_id: category_1.id, approved: true)}
    given!(:article_2){create(:article, title: "2", user_id: user.id, category_id: category_1.id, approved: true)}

    # scenario 'User go see aricles ' do   
        
    #   visit category_path(category_1)
    # #   save_and_open_page

    # #   within(".article-#{answer1.id}") do
    # #     click_on 'Make Best'
    # #   end

    #   first = find(".article-#{article_2.id}")

    #   expect(first).to have_sibling(".article-#{article_1.id}", below: first)
    # end
  end
end