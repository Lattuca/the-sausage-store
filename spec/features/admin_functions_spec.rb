require "spec_helper"

describe "Admin Features" do
  before :each do
    admin = User.create(admin_attributes)
    visit admin_path
    expect(page).to have_text("Please Log In")
    fill_in('Name', :with => admin.name)
    fill_in('Password', :with => admin.password)
    click_on "Login"
    #expect(page).to have_text("Admin Functions")
  end

 it "shows admin functions" do
   visit admin_path
   expect(page).to have_text("Sausage Inventory")
   expect(page).to have_text("Orders Processed")
   expect(page).to have_text("Users")
   expect(page).to have_text("Line Items")
   expect(page).to have_text("Admin Logout")
 end
end
