require "spec_helper"

describe "Admin User Features" do
  before :each do
    admin = User.create(admin_attributes)
    visit admin_path
    expect(page).to have_text("Please Log In")
    fill_in('Name', :with => admin.name)
    fill_in('Password', :with => admin.password)
    click_on "Login"
    #expect(page).to have_text("Admin Functions")
  end

  it "list users" do

    visit admin_path
    user1 = User.create(admin_attributes)
    click_link ("Users")
    expect(current_path).to eq users_path

    expect(page).to have_text("Listing Users")
    expect(page).to have_text("User Name")
    click_link ("Back to Admin")
    expect(current_path).to eq admin_path
  end

  it "Show User" do
    visit admin_path
    user1 = User.create(admin_attributes)
    click_link ("Users")
    expect(current_path).to eq users_path
    click_link ("Show")
    #expect(current_path).to eq("/users/1")

    expect(page).to have_text("Name:")
    expect(page).to have_text(user1.name)
    click_link ("Back to Users")
    expect(current_path).to eq users_path
  end

  it "Edit user" do
    visit admin_path
    user1 = User.create(admin_attributes)
    click_link ("Users")
    expect(current_path).to eq users_path
    click_link ("Edit")
    #expect(current_path).to eq ("/users/1/edit")
    #expect(current_path).to eq (edit_user_path(id: user1.id))
    expect(page).to have_text("Editing User")
    #expect(page).to have_text(user1.name)
    click_link "Back to Users"
  end

  it "New user" do
    visit admin_path
    user1 = User.create(admin_attributes)
    click_link ("Users")
    expect(current_path).to eq users_path
    click_link ("New User")
    user2 = User.create(user_attributes)
    expect(current_path).to eq new_user_path
    expect(page).to have_text("New User")
    #fill_in('order_name', :with => order1.name)
    fill_in('user_name', :with => user2.name)
    fill_in('user_password', :with => user2.password)
    fill_in('user_password_confirmation', :with => user2.password_confirmation)
    click_link "Back to Users"
  end

end
