class Account
  attr_reader :name, :balance
  def initialize(name, balance = 100)
    @name = name
    @balance = balance
  end

  private
  def pin
    @pin = 1234
  end

  def pin_error
    return "Access denied: incorrect PIN."
  end

  public 
  def display_balance(pin_number)
    if pin_number == pin
      puts "Balance: $#{@balance}." 
    else
      puts pin_error
    end
  end

  def withdraw(pin_number, amount)
    if pin_number == pin
      if(@balance - amount >= 0)
        @balance -= amount
        puts "Withdrew #{amount}. New balance: $#{@balance}"
      else
        puts "Cannot do that as your balance is less than the amount you want to withdraw"
      end
    else
      puts pin_error
    end
  end

  def details(pin_number)
    if(pin_number == pin)
     puts "*******"
     puts "Name is #{@name}"
     puts "Balanace is #{@balance}"
    else
      puts pin_error
    end
  end

  def deposit(pin_number, amount)
    if pin_number == pin
      @balance += amount
      puts "Deposited #{amount}. New balance: $#{@balance}"
    else
      puts pin_error
    end
  end
end

class SavingsAccounts < Account
  def initialize(name, balance = 100, fat_name)
    super(name, balance)
    @fat_name = fat_name
  end
  def details(pin_number)
    super(pin_number)
    if pin_number == pin
      puts "Father name is #{@fat_name}"
      puts "*******"
    end
  end
end

checking_account = SavingsAccounts.new("hamayun", 5000, "waheed")
checking_account.display_balance(1234)
checking_account.withdraw(1234, 2000)
checking_account.deposit(1234, 2000)
checking_account.details(1234)
