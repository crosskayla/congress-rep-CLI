class Senator

  attr_accessor :first_name, :last_name, :party, :state, :address, :phone

  @@all = []
  
  def initialize(params = {})
    params.each { |key, value| send "#{key}=", value }
    @@all << self
  end

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

    sen_array.each do |senator|
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
    
    self.all.sort_by!{|x| x.last_name}
    self.all.sort_by!{|x| x.state}
    
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


end
