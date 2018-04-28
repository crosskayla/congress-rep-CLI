#command line project start
class Scraper

  def get_page
    n = Nokogiri::HTML(open("https://www.senate.gov/general/contact_information/senators_cfm.cfm"))
  end

  def scrape_senators
    els = get_page.css('div.contenttext a')
    sen_names = els.collect {|e| e.text.strip}
    sen_names.reject!{|name| name.include?("www.") || name.empty?}
    sen_names.each_with_index do |name, i|
      puts "#{i+1}- #{name}"
    end
  end

end
