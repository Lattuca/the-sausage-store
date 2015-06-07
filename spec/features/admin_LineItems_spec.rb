require "spec_helper"

describe "Admin Order Line Items Features" do
  before :each do
    admin = User.create(admin_attributes)
    visit admin_path
    expect(page).to have_text("Please Log In")
    fill_in('Name', :with => admin.name)
    fill_in('Password', :with => admin.password)
    click_on "Login"
    #expect(page).to have_text("Admin Functions")
  end

  it "list order line items" do
    visit admin_path
    s1 = Sausage.create(sausage_1_attribute)
    #li1 = LineItem.create(line_item_attributes)
    click_link ("Line Items")
    expect(page).to have_text("Listing of Line Items")
    expect(page).to have_text("id")
    expect(page).to have_text("Sausage")
    expect(page).to have_text("Cart")
    expect(page).to have_text("Qty")
    click_link ("Back to Admin")
    expect(current_path).to eq admin_path
  end

  it "show a line item" do
    visit admin_path
    s1 = Sausage.create(sausage_1_attribute)
    #li1 = LineItem.create(line_item_attributes)
    click_link ("Line Items")
    #click_link ("Show")
    #expect(page).to have_text("Sausage:")
    #expect(page).to have_text("Cart#:")
    #expect(page).to have_text("Quantity:")
    #click_link ("Back to Line Items")
    expect(current_path).to eq line_items_path
  end

end
