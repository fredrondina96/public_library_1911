require_relative '../lib/book'
require_relative '../lib/author'
require_relative '../lib/library'
require "minitest/autorun"
require "minitest/pride"
require 'pry'

class LibraryTest < MiniTest::Test

  def setup
      @dpl = Library.new("Denver Public Library")
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @professor = @charlotte_bronte.write("The Professor", "1857")
      @villette = @charlotte_bronte.write("Villette", "1853")
      @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_the_library_exists
    assert_instance_of Library, @dpl
  end

  def test_library_has_attributes
    assert_equal @dpl.name, "Denver Public Library"
    assert_equal @dpl.books, []
    assert_equal @dpl.authors, []
  end

  def test_library_can_add_authors
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    assert_equal @dpl.authors.length, 2
  end

  def test_library_can_store_books_from_authors
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    assert_equal @dpl.books.length, 4
  end

  def test_library_can_return_publication_time_frames
    expected = {:start=>"1847", :end=>"1857"}
    assert_equal @dpl.publication_time_frame_for(@charlotte_bronte), expected
    expected = {:start=>"1960", :end=>"1960"}
    assert_equal @dpl.publication_time_frame_for(@harper_lee), expected

  end
end
