require_relative '../lib/book'
require "minitest/autorun"
require "minitest/pride"
require 'pry'


class BookTest < MiniTest::Test

  def setup
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  def test_a_book_exists
    assert_instance_of Book, @book
  end

  def test_book_has_attributes
    assert_equal @book.author_first_name, "Harper"
    assert_equal @book.author_last_name, "Lee"
    assert_equal @book.title, "To Kill a Mockingbird"
    assert_equal @book.publication_date, "July 11, 1960"
    assert_equal @book.publication_year, "1960"
  end
end
