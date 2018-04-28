class Senator

  attr_accessor :first_name, :last_name

  def self.new_from_website(s)
    els = s.css('a')
    sen_names = els.collect {|e| e.text.strip}
    sen_names.reject!{|name| name.include?("www.") || name.empty?}
    sen_names.each_with_index do |name, i|
      puts "#{i+1}- #{name}"
    end
  end

  def initialize()
  end

end
