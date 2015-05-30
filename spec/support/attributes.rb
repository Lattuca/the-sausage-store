def sausage_1_attribute(overides = {})
  {
    name: "Sweet Italian",
    description: "Pork, Italian spices and white wine",
    qty: 20,
    fresh: true,
    calories: 300,
    price: 6.99
  }.merge(overides)
end

def sausage_2_attribute(overides = {})
  {
    name: "Bratwurst",
    description: "pork & veal, German spices and white wine",
    qty: 10,
    fresh: true,
    calories: 700,
    price: 8.99
  }.merge(overides)
end

def sausage_3_attribute(overides = {})
  {
    name: "Baresse",
    description: "pork & veal, southern italian spices and white wine",
    qty: 10,
    fresh: true,
    calories: 700,
    price: 8.99
  }.merge(overides)
end

def admin_attributes(overrides = {})
  {
    name: "system",
    password: "manager",
    password_confirmation: "manager"
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: "Carmelo",
    password: "abc123",
    password_confirmation: "abc123"
  }.merge(overrides)
end

def order_attributes(overides = {})
{
  name: "Belair Rocklin",
  address: "2350 Sunset Blvd Rocklin, 95765, CA",
  email: "store134@belair.com",
  pay_type: "Credit Card",
  total_price: 10.99
}.merge(overides)
end

def line_item_attributes(overides = {})
{
  id: 1,
  sausage_id: 1,
  cart_id: 3,
  quantity: 4
}.merge(overides)
end
