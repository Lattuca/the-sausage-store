require "spec_helper"

describe "Admin Sausage Features" do
  before :each do
    admin = User.create(admin_attributes)
    visit admin_path
    expect(page).to have_text("Please Log In")
    fill_in('Name', :with => admin.name)
    fill_in('Password', :with => admin.password)
    click_on "Login"
    #expect(page).to have_text("Admin Functions")
  end

 it "Verify Sausage Admin functions text" do
   visit admin_path
   sausage1 = Sausage.create(sausage_1_attribute)
   sausage2 = Sausage.create(sausage_2_attribute)
   click_link ("Sausage Inventory")
   expect(page).to have_text("Current Sausage Inventory")
   expect(page).to have_text(sausage1.name)
   expect(page).to have_text(sausage1.description)
   expect(page).to have_text(sausage1.qty)
   expect(page).to have_text(sausage1.fresh)
   expect(page).to have_text(sausage1.calories)
   expect(page).to have_text(sausage1.price)
   expect(page).to have_text(sausage2.name)
   expect(page).to have_text(sausage2.description)
   expect(page).to have_text(sausage2.qty)
   expect(page).to have_text(sausage2.fresh)
   expect(page).to have_text(sausage2.calories)
   expect(page).to have_text(sausage2.price)
   expect(page).to have_text("Add new Sausage")
   expect(page).to have_text("Back to Admin")
   expect(page).to have_text("Admin for Carmelo's Sausage Store")
   expect(page).to have_text("Sausage Store Under Development - Copyright")
 end

 it "Admin Sausage Add new Sausage" do
   visit admin_path
   sausage1 = Sausage.create(sausage_1_attribute)
   sausage2 = Sausage.create(sausage_2_attribute)
   click_link ("Sausage Inventory")
   click_link ("Add new Sausage")
   expect(current_path).to eq(new_sausage_path)
   expect(page).to have_text("New Sausage")
   expect(page).to have_text("Back to Sausage Inventory")
 end

 it "Enter a new Sausage and view" do
   visit new_sausage_path
   click_button ("Create Sausage")
   sausage3 = Sausage.create(sausage_3_attribute)
   expect(page).to have_text("Back to Sausage Inventory")
   fill_in('Name', :with => sausage3.name)
   fill_in('Description', :with => sausage3.description)
   fill_in('Qty', :with => sausage3.qty)
   check 'Fresh'
   fill_in('Calories', :with => sausage3.calories)
   fill_in('Price', :with => sausage3.price)
   click_button ("Create Sausage")
   expect(current_path).to eq sausages_path
end

it "display sausage product" do
  sausage3 = Sausage.create(sausage_3_attribute)
  #visit "sausages/1"
  #expect(current_path).to eq ("sausages/1")
  #expect(page).to have_text("Display Sausage Product")
  #expect(page).to have_text("Name")
  #expect(page).to have_text("Description")
  #expect(page).to have_text("Calories")
  #expect(page).to have_text("Price")
  #expect(page).to have_text(sausage3.name)
  #expect(page).to have_text(sausage3.description)
  #expect(page).to have_text(sausage3.calories)
  #expect(page).to have_text(sausage3.qty)
  #expect(page).to have_text(sausage3.fresh)
  #expect(page).to have_text(sausage3.price)
  #click_link("Back to Sausage Inventory")
  #expect(current_path).to eq sausages_path
  #expect(page).to have_text("Current Sausage Inventory")
  #click_link "Back to Admin"
  #expect(current_path).to eq admin_path
  #expect(page).to have_text("Admin Functions")
 end
end
