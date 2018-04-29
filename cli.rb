class CLI

  def start
    puts "Welcome!"
    puts "Please enter your state, or enter 'list' to see a list of states."
    input = gets.strip
    if input == "list"
      Senator.print_states
    else
      Senator.find_state_sens(input)
    end
  end

end
