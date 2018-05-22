dirname = File.basename(Dir.getwd)
require_relative "../#{dirname}/config/environment"

s = Scraper.new
s.scrape_senators

CLI.new.start