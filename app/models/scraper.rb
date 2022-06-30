require "open-uri"
require "nokogiri"
require "pry-byebug"

class Scraper
  base_url = "https://petit-prince-collection.com/lang/collection.php?lang=fr"
  file = URI.open(base_url).read
  doc = Nokogiri::HTML(file)

  books = doc.search(".story a")

  # html_doc.search(".standard-card-new__article-title").each do |element|
  #   puts element.text.strip
  #   puts element.attribute("href").value
end

scraper = Scraper.new



#-------------------------
# def fetch_movie_urls
#   top_url = "https://www.imdb.com/chart/top"
#   doc = Nokogiri::HTML(URI.open(top_url).read)
#   movies = doc.search(".titleColumn a")
#   movies.take(5).map do |movie|
#     uri = URI.parse(movie.attributes["href"].value)
#     uri.scheme = "https"
#     uri.host = "www.imdb.com"
#     uri.query = nil
#     uri.to_s
#   end
# end

# def scrape_movie(url)
#   doc = Nokogiri::HTML(URI.open(url, "Accept-Language" => "en-US").read)

#   title = doc.search('h1').text
#   year = doc.search('.TitleBlockMetaData__StyledTextLink-sc-12ein40-1').first.text.match(/(?<year>\d{4})/)[:year].to_i
#   storyline = doc.search('.GenresAndPlot__Plot-sc-cum89p-6 span').first.text
#   director = doc.search('.ipc-metadata-list__item:contains("Director") a').first.text
#   cast = doc.search('.ipc-metadata-list__item:contains("Stars") a.ipc-metadata-list-item__list-content-item').map { |element| element.text }.uniq

#   {
#     title: title,
#     cast: cast,
#     director: director,
#     storyline: storyline,
#     year: year
#   }
# end
