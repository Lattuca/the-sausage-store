require "spec_helper"
describe "Check out" do

  it "Display a sausage" do
    sausage1 = Sausage.create(sausage_1_attribute)

    visit store_path
    expect(page).to have_text(sausage1.name)
    expect(page).to have_text(sausage1.description)
    expect(page).to have_text(sausage1.price)
    expect(page).to have_text(sausage1.qty)
    expect(page).to have_text(sausage1.calories)
    expect(page).to have_text(sausage1.fresh)
  end

  # view cart

  it "Sauage Cart with purchase" do
   sausage1 = Sausage.create(sausage_1_attribute)
   visit store_path
   click_button "Add to Cart"
   expect(current_path).to eq("/carts/1")
   expect(page).to have_text("Sausage was added to Cart")
   expect(page).to have_text("Your Sausage Cart Contains")
   expect(page).to have_text(sausage1.name)
   expect(page).to have_text("Total Cost")
 end
end
