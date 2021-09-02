require 'rails_helper'

RSpec.feature "CreateUsers", type: :system do
  
  before do
    driven_by(:rack_test)
  end

  it "visits the page with the form to create a user and devise" do
    visit 'users/sign_up'

    fill_in "Email", with: "micodevacc@gmail.com"
    fill_in "Password", with: "newuser123"
    fill_in "Password confirmation", with: "newuser123"

    expect { click_on 'Sign up' }.to change { User.count }.by(1)
  end
end