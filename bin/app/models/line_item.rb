class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :sausage
  belongs_to :cart

  def total_price
    sausage.price * quantity
  end
end
