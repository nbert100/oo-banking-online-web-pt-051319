require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  
  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
   if self.valid? 
    self.sender.balance -= amount
    self.receiver.deposit(amount)
    self.status = "complete"
 
  else
      puts "Transaction rejected. Please check your account balance."
    self.status = "rejected"
      
    end
  end

  def reverse_transfer
    
  end

end
