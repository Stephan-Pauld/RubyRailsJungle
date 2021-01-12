require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
    @user = User.create!(name: 'rahul', email: 'raha@gmail.com', password: '12345', password_confirmation: '12345')
  end





  scenario "see item in cart and press cart button" do
    # ACT
    visit '/login'
    fill_in 'email', with: 'raha@gmail.com'
    fill_in 'password', with: '12345'
    find('input[name="commit"]').click
    sleep 5
    save_screenshot
    first('article.product').find_button('Add').click
    sleep 5
    save_screenshot
    expect(page).to have_text ' My Cart (1)'


    #  This also works!!!
    # expect(page).to have_content('My Cart (1)')



  end


end
