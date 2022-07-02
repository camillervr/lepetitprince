require "open-uri"
require "nokogiri"
# require "pry-byebug"

class Scraper
  def create_books
    url = "https://petit-prince-collection.com/lang/collection.php?lang=fr"
    file = URI.open(url).read
    doc = Nokogiri::HTML(file)

    # binding.pry

    books = []

    doc.search("tr").drop(14).map do |tr|
      title = tr.search("img").attribute("src").to_s.gsub("../..", "https://petit-prince-collection.com")
      language = tr.search(".story a").text.strip.capitalize

      book_info = {
        user: User.first,
        title: title,
        language: language,
      }

      books << book_info
    end
    books
  end
end

scrape = Scraper.new
