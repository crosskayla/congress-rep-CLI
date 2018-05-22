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
        print_all_sens
      when "state"
        puts "Please enter your state:"
        input = gets.strip
        puts
        found_sens = Senator.all.select{|x| x.state == input}
        puts "#{input} Senators: "
        print_state_sens(found_sens)
        puts "Would you like contact information for your senators? If so, type 'yes.'"
        puts "Otherwise, type 'no' to go to the main menu."
        input = gets.strip.downcase
        puts
        if input == "yes"
          found_sens.each{|s| print_contact_info(s)}
          sleep(5)
        end
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
  
  def print_contact_info(senator_obj)
    puts "Contact information for Senator #{senator_obj.first_name} #{senator_obj.last_name}:"
    puts "\tAddress: #{senator_obj.address}"
    puts "\tPhone number: #{senator_obj.phone}"
    puts
  end
  
  def print_all_sens
    prev_state = nil
    Senator.all.each do |x|
      if x.state == prev_state
        puts " & #{x.first_name} #{x.last_name} (#{x.party})"
      else
        print "#{x.state} - #{x.first_name} #{x.last_name} (#{x.party})"
        prev_state = x.state
      end
    end
  end

  def print_state_sens(found_sens)
    found_sens.each do |sen|
      puts "\t\t#{sen.first_name} #{sen.last_name} - #{sen.party}"
    end
    puts
  end

end
