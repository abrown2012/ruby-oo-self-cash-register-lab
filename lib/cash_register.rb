class CashRegister
    
    attr_accessor :total, :discount, :cart
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart = []
    end 

    def add_item(title, price, quantity=1)
        adding_info = {}
        adding_info[:name] = title
        adding_info[:price] = price
        adding_info[:quantity] = quantity

        self.cart << adding_info

        self.total=(@total + (price*quantity))
    end

    def apply_discount
        if @discount == 0 
            p "There is no discount to apply."
        else 
            self.total=(@total-(@total*@discount)/100)
            p "After the discount, the total comes to $#{@total}."   
        end      
    end

    def items
        new_array = []
        self.cart.each do |item|
            i = 0
            while i < item[:quantity] do 
                new_array << item[:name]
                i += 1 
            end 
        end 
        new_array
    end 

    def void_last_transaction
        
       self.total= @total - (@cart[-1][:price]*@cart[-1][:quantity])
       self.cart = @cart.pop 
       
    end 

end 
