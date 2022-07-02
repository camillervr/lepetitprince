require "open-uri"
require "nokogiri"
# require "pry-byebug"

class Scraper
  def add_books(doc, books, drop)
    doc.search("tr").drop(drop).map do |tr|
      title = tr.search("img").attribute("src").to_s.gsub("../..", "https://petit-prince-collection.com")
      language = tr.search(".story a").text.strip.capitalize

      book_info = {
        user: User.first,
        title: title,
        language: language,
      }

      books << book_info if book_info[:language] != ""
    end
  end

  def create_books
    books = []

    url = "https://petit-prince-collection.com/lang/collection.php?lang=fr"
    file = URI.open(url).read
    doc = Nokogiri::HTML(file)
    drop = 14

    # binding.pry

    add_books(doc, books, drop)

    url = "https://petit-prince-collection.com/lang/transcriptions.php?lang=fr"
    file = URI.open(url).read
    doc = Nokogiri::HTML(file)
    drop = 1

    add_books(doc, books, drop)

    books
  end
end

scrape = Scraper.new
