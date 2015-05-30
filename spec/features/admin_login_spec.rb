require "spec_helper"

describe "admin main screen tests" do

  it "admin header and footer" do
    visit login_path

    expect(page).to have_text("Admin for Carmelo's Sausage Store")
    expect(page).to have_text("Sausage Store Under Development - Copyright")
  end

  it "login as admin" do
    admin = User.create(admin_attributes)
    visit admin_path

    expect(page).to have_text("Please Log In")
    expect(page).to have_text("Name")
    expect(page).to have_text("Password:")
    fill_in('Name', :with => admin.name)
    fill_in('Password', :with => admin.password)
    click_on "Login"
    expect(page).to have_text("Admin Functions")
    expect(page).to have_text("Store Order Status:")
    expect(current_path).to eq(admin_path)
  end
end
