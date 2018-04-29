require_relative '../my_new_directory/config/environment'

s = Scraper.new
s.scrape_senators

CLI.new.start
