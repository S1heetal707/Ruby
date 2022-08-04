$LOAD_PATH << '.'
require 'csv'

module LoginModule
  class LoginClass
    def signin
      puts " "
      puts "Enter username"
      @uname = gets.chomp
      puts "Enter email"
      @uemail = gets.chomp
      login
    end

    def login
      login_passed = false
      CSV.foreach("my_task.csv", headers: true) do |row|
        login_passed = row[0] == @uname && row[1] == @uemail
        break if login_passed
      end
      if login_passed != true
        puts "invalid username or password, pls try again"
        signin
      else
        puts "successfully login"
      end
    end
  end
end

# obj = LoginModule::LoginClass.new
# obj.signin