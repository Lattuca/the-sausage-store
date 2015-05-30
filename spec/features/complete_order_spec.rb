require "spec_helper"
describe "Order Completed" do

  it "Thank you and continue shopping" do
     visit say_thank_you_path
     expect(page).to have_text("Thank You for your Order")
     expect(page).to have_text("Your sausages will should arrive within 5 business days from date of order. Please come back to Carmelo's Sausage Store!!!
     ")
     click_link("Buy more Sausages")
     expect(current_path).to eq(store_path)
   end

   it "Exit the sausage store" do
     visit say_thank_you_path
     expect(page).to have_text("Thank You for your Order")
     expect(page).to have_text("Your sausages will should arrive within 5 business days from date of order. Please come back to Carmelo's Sausage Store!!!
     ")
     click_link("Exit Sausage Store")
     expect(current_path).to eq(say_good_bye_path)
     expect(page).to have_text("Exiting from Carmelo's Sausage Store.")
   end

   it "good bye and buy more" do
     visit say_thank_you_path
     expect(page).to have_text("Buy more Sausages")
     click_link "Buy more Sausages"
     expect(current_path).to eq(store_path)
   end

   it "good bye and exit" do
     visit say_thank_you_path
     expect(page).to have_text("Exit Sausage Store")
     click_link "Exit Sausage Store"
     expect(current_path).to eq (say_good_bye_path)
   end

   it "good bye and return to store" do
     visit  say_good_bye_path
     expect(page).to have_text("Return to Carmelo's Store")
     click_link "Return to Carmelo's Store"
     expect(current_path).to eq (welcome_path)
   end

 end
