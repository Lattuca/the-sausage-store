require "spec_helper"
describe "Select sausage and process purchase, big test!!" do

  it "Display sausages" do
    sausage1 = Sausage.create(sausage_1_attribute)

    visit store_path
    expect(page).to have_text(sausage1.name)
    expect(page).to have_text(sausage1.description)
    expect(page).to have_text(sausage1.price)
    expect(page).to have_text(sausage1.qty)
    expect(page).to have_text(sausage1.calories)
    expect(page).to have_text(sausage1.fresh)
  end

  it "Process cart purchase, check out, and complete order" do
   sausage1 = Sausage.create(sausage_1_attribute)
   visit store_path
   click_button "Add to Cart"
   expect(current_path).to eq("/carts/1")
   expect(page).to have_text("Sausage was added to Cart")
   expect(page).to have_text("Your Sausage Cart Contains")
   expect(page).to have_text(sausage1.name)
   expect(page).to have_text("Total Cost")
   click_link "Checkout"

   # complete the order
   order1 = Order.create(order_attributes)

   expect(current_path).to eq "/orders/new"
   expect(page).to have_text("Please Enter Your Details")

   fill_in('order_name', :with => order1.name)
   fill_in('order_address', :with => order1.address)
   fill_in('order_email', :with => order1.email)

   expect(page).to have_text("Total price")
   #fill_in('order_pay_type', :with => order1.pay_type)
   #select order1.pay_type :from => order[pay_type]
   select "Select a payment method", :from => "order[pay_type]"
   click_on ("Place Order")
   #expect(current_path).to eq say_thank_you_path
  end
end
