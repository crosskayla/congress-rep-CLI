class Senator

  attr_accessor :first_name, :last_name, :party, :state, :address, :phone

  @@all = []

  def self.new_from_website(s)
    sen_array = []
    s.shift
    els = s.collect {|e| e.text}
    counter = 0
    els.each_with_index do |e, i|
      if e.include?("Contact:")
        sen_array << els[counter..i]
        counter = i + 1
      elsif i < counter
        next
      end
    end

    t = sen_array.each do |senator|
      senator.each do |elem|
        elem.gsub!(/\s{2,}/, "")
      end
      params = {}
      temp = senator.first.split("- (")
      names = temp[0].split(", ")
      params["first_name"] = names[1]
      params["last_name"] = names[0]
      party_state = temp[1].split(")")[0].split(" - ")
      params["party"] = party_state[0]
      params["state"] = party_state[1]
      params["address"] = senator[1]
      params["phone"] = senator[2]
      Senator.new(params)
    end

  end

  def initialize(params = {})
    params.each { |key, value| send "#{key}=", value }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_names
    all.each_with_index {|obj, i| puts "#{i+1}. #{obj.first_name} #{obj.last_name}"}
  end

  def self.print_states
    s = all.sort_by{|x| x.state}.collect{|x| x.state}
    puts s.uniq.join(" | ")
  end

  def print_contact_info
    puts "Contact information for Senator #{self.first_name} #{self.last_name}:"
    puts "\tAddress: #{self.address}"
    puts "\tPhone number: #{self.phone}"
    puts
  end

  def self.find_state_sens(state)
    puts "#{state} Senators: "
    found_sens = all.select{|x| x.state == state}
    found_sens.each do |sen|
      puts "\t\t#{sen.first_name} #{sen.last_name} - #{sen.party}"
    end
    puts
    found_sens
  end

  def self.print_state_sens
    all.sort_by!{|x| x.last_name}
    all.sort_by!{|x| x.state}
    prev_state = nil
    all.each do |x|
      if x.state == prev_state
        puts " & #{x.first_name} #{x.last_name} (#{x.party})"
      else
        print "#{x.state} - #{x.first_name} #{x.last_name} (#{x.party})"
        prev_state = x.state
      end
    end
  end

end