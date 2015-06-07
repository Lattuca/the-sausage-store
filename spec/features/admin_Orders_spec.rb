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

  it "list orders" do

    visit admin_path
    order1 = Order.create(order_attributes)
    click_link ("Orders Processed")
    expect(current_path).to eq orders_path

    expect(page).to have_text("Listing of Orders")
    expect(page).to have_text("Id")
    expect(page).to have_text("Name")
    expect(page).to have_text("Address")
    expect(page).to have_text("Email")
    expect(page).to have_text("Pay type")
    expect(page).to have_text("Total Price")
    expect(page).to have_text(order1.name)
    expect(page).to have_text(order1.address)
    expect(page).to have_text(order1.email)
    expect(page).to have_text(order1.pay_type)
    expect(page).to have_text(order1.total_price)
  end

  it "Show Order" do
    visit admin_path
    order1 = Order.create(order_attributes)
    click_link ("Orders Processed")
    expect(current_path).to eq orders_path
    click_link ("Show")
    #expect(current_path).to eq("/orders/1")

    expect(page).to have_text("Name:")
    expect(page).to have_text(order1.name)
    expect(page).to have_text("Address:")
    expect(page).to have_text(order1.address)
    expect(page).to have_text("Email:")
    expect(page).to have_text(order1.email)
    expect(page).to have_text("Pay type:")
    expect(page).to have_text(order1.pay_type)
    expect(page).to have_text("Total Price:")
    expect(page).to have_text(order1.total_price)
    expect(page).to have_text("Sausages Ordered/Qty:")
    click_link ("Back to Orders")
    expect(current_path).to eq orders_path
  end

  it "Edit Order" do
    visit admin_path
    order1 = Order.create(order_attributes)
    click_link ("Orders Processed")
    expect(current_path).to eq orders_path
    click_link ("Edit")
    #expect(current_path).to eq ("/orders/1/edit")
    expect(page).to have_text("Editing Order")
  end



end
