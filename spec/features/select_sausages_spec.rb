require "spec_helper"
describe "Select list of sausages" do

  it "Enter Store to select sausages" do
    visit welcome_path
    click_link "Enter Carmelo's Sausage Store"
    expect(current_path).to eq(store_path)
    expect(page).to have_text("Listing of Our Sausages")
  end

  it "shows sausage selection with 1 sausage" do

    sausage1 = Sausage.create(sausage_1_attribute)
    visit store_path
    expect(page).to have_text("Listing of Our Sausages")
    expect(page).to have_text(sausage1.name)
    expect(page).to have_text(sausage1.description)
    expect(page).to have_text(sausage1.qty)
    expect(page).to have_text(sausage1.fresh)
    expect(page).to have_text(sausage1.calories)
    expect(page).to have_text(sausage1.price)
  end

  it "shows sausage selection with 2 sausages" do

        sausage1 = Sausage.create(sausage_1_attribute)
        visit store_path
        expect(page).to have_text(sausage1.name)
        expect(page).to have_text(sausage1.description)
        expect(page).to have_text(sausage1.qty)
        expect(page).to have_text(sausage1.fresh)
        expect(page).to have_text(sausage1.calories)
        expect(page).to have_text(sausage1.price)

        sausage2 = Sausage.create(sausage_2_attribute)
        visit store_path
        expect(page).to have_text(sausage2.name)
        expect(page).to have_text(sausage2.description)
        expect(page).to have_text(sausage2.qty)
        expect(page).to have_text(sausage2.fresh)
        expect(page).to have_text(sausage2.calories)
        expect(page).to have_text(sausage2.price)
      end

end
