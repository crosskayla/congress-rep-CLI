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
      elsif e.include?("(202) 224-5054")
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
        temp = senator.first.split("- (")
        names = temp[0].split(", ")
        first_name, last_name = names[1], names[0]
        party_state = temp[1].split(")")[0].split(" - ")
        party, state = party_state[0], party_state[1]
        address = senator[1]
        phone = senator[2]
        Senator.new(first_name, last_name, party, state, address, phone)
    end

    #need to parse senator info

  end

  def initialize(first_name, last_name, party, state, address, phone)
    @first_name = first_name
    @last_name = last_name
    @party = party
    @state = state
    @address = address
    @phone = phone
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_names
    all.each_with_index {|obj, i| puts "#{i+1}. #{obj.first_name} #{obj.last_name}"}
    print_states
  end

  def self.print_states
    all.sort_by!{|x| x.last_name}
    all.sort_by!{|x| x.state}
    prev_state = nil
    all.each do |x|
      if x.state == prev_state
        puts " & #{x.first_name} #{x.last_name}"
      else
        print "#{x.state} - #{x.first_name} #{x.last_name}"
        prev_state = x.state
      end
    end
  end

end
