require "spec_helper"

describe "admin logout test" do
  before :each do
    admin = User.create(admin_attributes)
    visit admin_path
    expect(page).to have_text("Please Log In")
    fill_in('Name', :with => admin.name)
    fill_in('Password', :with => admin.password)
    click_on "Login"
    #expect(page).to have_text("Admin Functions")
  end

  it "logout as admin" do
    admin = User.create(admin_attributes)
    visit admin_path
    click_link ("Admin Logout")
    expect(current_path).to eq (say_good_bye_path)

    expect(page).to have_text("Thank you for your using Carmelo's Sausage. Please come again")
    click_link ("Return to Carmelo's Store")
    expect(current_path).to eq (welcome_path)
  end
end
