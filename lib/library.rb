require_relative '../lib/book'
require_relative '../lib/author'

class Library
attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each {|book| @books << book}
  end

  def publication_time_frame_for(author)
    time_frame = {}
      author.books.each do |book|
        if time_frame[:start] == nil
          time_frame[:start] = book.publication_year
        elsif time_frame[:start].to_i > book.publication_year.to_i
          time_frame[:start] = book.publication_year
        end
      end

      author.books.each do |book|
        if time_frame[:end] == nil
          time_frame[:end] = book.publication_year
        elsif time_frame[:end].to_i < book.publication_year.to_i
          time_frame[:end] = book.publication_year
        end
      end
      return time_frame
  end
  # def checkout(requested_book)
  # if @books.find {|book| book==requested_book} != nil
  # end
end
