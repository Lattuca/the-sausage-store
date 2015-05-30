require "spec_helper"
describe "shows welcome page" do
  it "Shows welcome header" do
    visit welcome_path
    expect(page).to have_text("Welcome to Carmelo's Sausage Store")
  end

  it "shows footer" do
    visit welcome_path
    expect(page).to have_text("Under Development - Copyright")
  end
end
