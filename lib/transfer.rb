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
   if valid? && self.status == "pending" && sender.balance > amount
    sender.balance -= amount
    receiver.deposit(amount)
    self.status = "complete"
  
  else
    
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  
    end
  end

  def reverse_transfer
    if self.execute_transaction
    @sender.deposit(amount)
    @receiver.balance -= amount
    self.status = "reversed"
  end
  end

end
