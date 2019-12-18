require_relative '../lib/book'
require_relative '../lib/author'
require "minitest/autorun"
require "minitest/pride"
require 'pry'


class AuthorTest < MiniTest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_author_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_author_has_attributes
    assert_equal @charlotte_bronte.first_name, "Charlotte"
    assert_equal @charlotte_bronte.last_name, "Bronte"
    assert_equal @charlotte_bronte.name, "Charlotte Bronte"
    assert_equal @charlotte_bronte.books, []
  end

  def test_author_can_write_books
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal @charlotte_bronte.books.length, 1
    assert_kind_of Book, jane_eyre
    @charlotte_bronte.write("Villette", "1853")
    assert_equal @charlotte_bronte.books.length, 2
  end
end
