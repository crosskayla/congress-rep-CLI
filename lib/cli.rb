class CLI

  def start
    puts "Welcome!"
    input = nil
    while input != "exit"
      puts "\nMAIN MENU"
      puts "Please enter 'state' to input your state,
      or enter 'list' to see a list of senators from all states."
      puts "Otherwise, type 'exit' to exit the program."
      input = gets.strip
      case input
      when "list"
        Senator.print_state_sens
      when "state"
        puts "Please enter your state:"
        input = gets.strip
        puts
        found_sens = Senator.find_state_sens(input)
        puts "Would you like contact information for your senators? If so, type 'yes.'"
        puts "Otherwise, type 'no' to go to the main menu."
        input = gets.strip
        puts
        found_sens.each{|s| s.print_contact_info} if input == "yes"
      end
    end
    puts "Thanks for using CongressCLI."
    print "Quitting in 3... "
    sleep(1)
    print "2... "
    sleep(1)
    print "1... "
    sleep(1)
  end

end