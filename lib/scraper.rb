#command line project start
class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.senate.gov/general/contact_information/senators_cfm.cfm"))
  end

  def scrape_senators
    Senator.new_from_website(get_page.css('div.contenttext'))
  end

end
