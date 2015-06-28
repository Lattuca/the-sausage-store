class Sausage < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, :description, :qty, :calories, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true

 def yesno
   if fresh
     yesno = "Fresh"
   else
     yesno = "Frozen/Smoked/Cured"
   end
 end
 def qty_to_purchase
   qty_to_purchase = 1
 end

  private
    # ensure that there are no line items referencing this sausage
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items Present')
        return false
      end
    end
end
