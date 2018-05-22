require_relative "../config/environment"

Scraper.new.scrape_senators

CLI.new.start