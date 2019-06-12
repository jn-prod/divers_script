require "nokogiri"
require "httparty"
require "byebug"

def scraper
  url = "https://remote.co/remote-jobs/developer/"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)

  jobs = Array.new

  job_listings = parsed_page.css("li.job_listing")

  page = 1

  per_page = job_listings.size
  total = parsed_page.css("li.job_listing").length.to_i
  last_page = (total.to_f / per_page.to_f).round 

  while page <= last_page
    pagination_url = "#{url}##{page}"
    puts pagination_url
    puts "Page: #{page} \n"
    pagination_unparsed_page = HTTParty.get(pagination_url)
    pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
    pagination_job_listings = pagination_parsed_page.css("li.job_listing")
    pagination_job_listings.each do |job_listing|
      job = {
        title: job_listing.css("h3").text,
        company: job_listing.css("div.company > span").text,
        url: job_listing.css("a")[0].attributes["href"].value
      }
      jobs << job
      puts "Added #{job[:title]} \n"
    end
    page += 1
  end
  byebug
end

scraper