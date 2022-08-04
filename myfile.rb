$LOAD_PATH << '.'
require "rubytask"
require "log"
include Register
include LoginModule

# # creating obj of signup and login
account = Register::CreateAccount.new()
account.display

puts " "
puts "Account login"
obj = LoginModule::LoginClass.new()
obj.signin


module MainModule
	class MainClass

		balance = Array.new
		history = Array.new

		def initialize(balance, history,sum)
			@balance = balance
			@history = history
			@sum = sum
		end

		def bal(balance, history)
			puts "your balance is #{@balance+@sum}"
			puts welcome(balance, history)
		end

		def his(balancel,history)
			p "this is your history"
			p history
			p bal(@balance,@history)
		end

		def dep(balance,history)
			p "How much u like to deposite"
			input = ""
			input = gets.chomp.to_i
			p "You are depositing #{input} Rs"
			@balance = @balance+input
			history << input
			puts bal(@balance,@history)
		end

		def withd(balance,history)
			p "How much u want to withdraw"
			input = ""
			input = gets.chomp.to_i
			if @balance < input
				puts error
			else
				p "You want to withdraw #{input}"
				@balance = @balance-input
				@history << -input
				puts bal(@balance,@history)
		  end
		end

		def exit
			p "Exit from the system"
		end

		def error
		  p "Error, invalid selection ,pls try again"
		end

		def welcome(balance,history)
			p "Welcome! pls enter b for balance check, w for withdraw, d for deposite and e for exit"
			response = gets.chomp.downcase
			case response
			when 'b'
			  bal(@balance,@history)
		  when 'w'
		  	withd(@balance,@history)
		  when "d"
		  	dep(@balance,@history)
		  when "e"
		  	exit
		  end
		end
  end
end

mainobj = MainModule::MainClass.new(0,0,0)
mainobj.welcome(@balance,@history)