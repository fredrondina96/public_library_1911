require 'pry'
require_relative 'book'
class Author

attr_reader :first_name, :last_name, :books

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def name
    (@first_name + " " + @last_name)
  end

  def write(title, date)
    book_info = {}
    book_info[:author_first_name] = @first_name
    book_info[:author_last_name] = @last_name
    book_info[:title] = title
    book_info[:publication_date] = date
    books << Book.new(book_info)
    return Book.new(book_info)
  end
end
