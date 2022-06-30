class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :language
      t.text :language_details
      t.string :country
      t.integer :date_of_acquisition
      t.integer :number_of_books
      t.text :notes
      t.boolean :in_my_collection, default: false
      t.boolean :wishlist, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
