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
   if valid? 
    sender.balance -= amount
    receiver.deposit(amount)
    status = "complete"
    self
  else
      puts "Transaction rejected. Please check your account balance."
    status = "rejected"
      self
    end
  end

  def reverse_transfer
    
  end

end
