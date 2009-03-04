require "#{File.dirname(__FILE__)}/test_helper"
require "#{File.dirname(__FILE__)}/../parse_table_of_contents"

class ParseTableOfContentsTest < Test::Unit::TestCase
  def setup
    @essays = build_essay_array
  end

  def test_should_return_an_array_of_arrays
    assert_kind_of Array, @essays
    assert_kind_of Array, @essays[0]
  end

  def test_should_parse_92_essays
    assert_equal 92, @essays.size
  end

  def test_should_return_expected_chapter_title_and_chapter_number_and_essay_title_for_the_first_essay
    assert_equal "Introduction (Chapter 1): What is Getting Real?", @essays[0][0]
  end

  def test_should_return_uri_for_the_first_essay
    assert_equal "ch01_What_is_Getting_Real.php", @essays[0][1]
  end

  def test_should_return_expected_chapter_title_and_chapter_number_and_essay_title_for_the_last_essay
    assert_equal "Conclusion (Chapter 16): 37signals Resources", @essays[91][0]
  end

  def test_should_return_uri_for_the_last_essay
    assert_equal "ch16_37signals_Resources.php", @essays[91][1]
  end
end
