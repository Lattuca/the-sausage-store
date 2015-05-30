class CombineItemsInCart < ActiveRecord::Migration

  def up
    # replace multiple items for a single sausage in the cart
    Cart.all.each do |cart|
      #count the number of each sausage in the cart
      sums = cart.line_items.group(:sausage_id).sum(:quantity)

      sums.each do |sausage_id, quantity|
        if quantity > 1
          # remove individual item
          cart.line_items.where(sausage_id: sausage_id).delete_all

          # replace with single item
          item = cart.line_items.build(sausage_id: sausage_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
  def down
    #
  end
end
