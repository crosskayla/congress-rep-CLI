require_relative "../config/environment"

s = Scraper.new
s.scrape_senators

CLI.new.start