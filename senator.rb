class Senator

  attr_accessor :first_name, :last_name

  @@all = []

  def self.new_from_website(s)
    s.shift
    els = s.css('a')
    sen_names = els.collect {|e| e.text.strip}
    sen_names.reject!{|name| name.include?("www.") || name.empty?}
    sen_names.each do |name|
      n = name.split(', ')
      new(n[1], n[0])
      n.clear
    end

    binding.pry
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_names
    all.each_with_index {|obj, i| puts "#{i+1}. #{obj.first_name} #{obj.last_name}"}
  end

end
