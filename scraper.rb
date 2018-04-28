#command line project start
class Scraper

  def get_page
    n = Nokogiri::HTML(open("https://www.senate.gov/general/contact_information/senators_cfm.cfm"))
    puts n.size
  end

end
