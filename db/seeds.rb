Book.destroy_all
User.destroy_all

user_one = User.new(
  email: "camille@sb.fr",
  password: "123456",
  first_name: "Camille",
  last_name: "Rivière"
)
user_one.save!


puts "Starting seeds..."
scrape = Scraper.new
books = scrape.create_books
Book.create_from_collection(books)
puts "Seeds created!"
