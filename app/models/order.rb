class Order < ApplicationRecord
    has_many :order_items
    before_save :set_subtotal

    def subtotal
       #order_items.collect{|order_item| order_item.valid? ? order_item.unit_price*order_item.quantity:0}.sum
        x = 0 #meaningful variable name
        order_items.each do |order_item|
            if order_item.valid?
                x+= order_item.unit_price*order_item.quantity
            end 
        end 
        x
    end

    private
    def set_subtotal
        self[:subtotal] = subtotal
    end 
end
