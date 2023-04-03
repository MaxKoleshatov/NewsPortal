require 'rails_helper'

feature 'User can go to the start page' do
  given!(:category_1) {create(:category)}
  given!(:category_2) { Category.create!(title: 'CategoryTitle_2') }
  given(:user) {create(:user)}


  scenario 'user can go to start page' do
    
    visit root_path

    expect(page).to have_content "Welcome News Portal"
  end

  scenario 'user can see all categories to start page' do
    
    visit root_path

    expect(page).to have_link "All categories"
  end

  scenario 'user can open all categories to start page' do
    
    visit root_path

    click_on 'All categories'

    # нужно доработать потому что проверяет наличие текста а не ссылок
    expect(page).to have_content category_1.title
    expect(page).to have_content category_2.title    
  end

  scenario 'The user see button login to start page' do
    
    visit root_path
    click_on 'Log in'

    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'    
  end

  scenario 'The user sees his nickname after a successful login on the start page' do
    
    sign_in(user)
    #нужно доработать в правый угол чтоб всегда был как в навигации
    expect(page).to have_content "Hello - #{user.profilename}"  
  end
end