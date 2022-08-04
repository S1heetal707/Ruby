$LOAD_PATH << '.'
require 'csv'

module Register
  class CreateAccount

    def username
      while 1
        p 'Enter your name :'
        @usr_name = gets.chomp().to_s
        valid = /\A[a-zA-Z0-9]+\z/
        if !(@usr_name =~ valid).nil?
          return @usr_name
        else
          puts 'username is invalid try again'
        end
      end
    end

    def useremail
      while 1
        p 'Enter the email'
        @usr_email = gets.chomp
        valid = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

        if !(@usr_email =~ valid).nil?
          return @usr_email
        else
          puts 'email is invalid try again'
        end
      end
    end

    def user_address
      p 'Enter your address'
      @usr_addr = gets.chomp
    end

    def user_pan
      p 'Enter your pan number'
      @usr_pan = gets.chomp
    end

    def user_bank
      p 'Enter the bank name'

      puts """
        For SBI press 1
        For BOB press 2
        For BOI press 3
        For HDFC press 4
      """

      @option = gets.chomp

      case @option
      when "1"
        puts 'Welcome to State bank of India'
      when "2"
        puts 'Welcome to Bank of Baroda'
      when "3"
        puts 'Welcome to Bank of India'
      when "4"
        puts 'Welcome to HDFC bank'
      end
    end

    def user_account_num
      @account_num = rand(1000000000..99999999900)
      puts 'Your generated account number'
      puts @account_num
    end

    def user_details
      puts "Your name is : "+@usr_name;
      puts "Your email is : "+@usr_email;
      puts "Your address is :"+@usr_addr;
      puts ("Your account number is :"  + @account_num.to_s)
    end

    def display
      username
      useremail
      user_address
      user_pan
      user_bank
      user_account_num
      puts" "
      puts "The account details of user"
      puts " "
      user_details
      # MainFile.csv_file
      headers = %w{name email phone address pan_number account_number}
      CSV.open("my_task.csv","a+") do |row| #if csv<1
        row << headers
        row << [@usr_name, @usr_email, @usr_addr,@usr_pan, @account_num]
      end
    end    
  end
end

# account = Register::CreateAccount.new()
# account.display 

