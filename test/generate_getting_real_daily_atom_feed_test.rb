require 'test/unit'
require '../generate_getting_real_daily_feed'
require 'hpricot'
require 'mocha'

class GenerateGettingRealDailyAtomFeedTest < Test::Unit::TestCase
  def setup
    write_atom_feed(0)
    @atom_file = Hpricot(open("atom.xml"))
  end

  def test_should_calculate_the_first_essay_index_if_today_is_launch_date
    Date.stubs(:today).returns(Date.new(2009, 02, 23))
    assert_equal 0, calculate_essay_index
  end

  def test_should_calculate_the_last_essay_index_if_today_is_91_days_after_launch_date
    Date.stubs(:today).returns(Date.new(2009, 02, 23) + 91)
    assert_equal 90, calculate_essay_index
    puts essays.size
  end

  def test_should_calculate_the_first_index_if_today_is_92_days_after_launch_date
    Date.stubs(:today).returns(Date.new(2009, 02, 23) + 92)
    assert_equal 0, calculate_essay_index
  end

  def test_should_have_the_feed_id
    assert_equal "tag:gettingrealdaily.com,2005:/", @atom_file.at("id").inner_html
  end

  def test_should_have_the_feed_html_link
    assert_equal "http://gettingreal.37signals.com", @atom_file.at("link[@type*='html']").attributes['href']
  end

  def test_should_have_the_feed_atom_link
    assert_equal "http://gettingrealdaily.com/atom.xml", @atom_file.at("link[@type*='atom']").attributes['href']
  end

  def test_should_have_the_feed_title
    assert_equal "Getting Real (daily)", @atom_file.at("title").inner_html
  end

  def test_should_have_the_feed_updated_to_now
    time_from_xmlschema = Time.parse(@atom_file.at("updated").inner_html)
    assert time_from_xmlschema > 1.minute.ago
  end

  def test_should_have_the_entry_id
    assert_equal "tag:gettingrealdaily.com,2005:/ch01_What_is_Getting_Real.php?20090303", @atom_file.at("entry/id").inner_html
  end

  def test_should_have_the_entry_published_to_now
    time_from_xmlschema = Time.parse(@atom_file.at("entry/published").inner_html)
    assert time_from_xmlschema > 1.minute.ago
  end

  def test_should_have_the_entry_updated_to_now
    time_from_xmlschema = Time.parse(@atom_file.at("entry/updated").inner_html)
    assert time_from_xmlschema > 1.minute.ago
  end

  def test_should_have_the_entry_html_link
    assert_equal "http://gettingreal.37signals.com/ch01_What_is_Getting_Real.php", @atom_file.at("entry/link[@type*='html']").attributes['href']
  end

  def test_should_have_the_entry_title
    assert_equal "Introduction (Chapter 1): What is Getting Real?", @atom_file.at("entry/title").inner_html
  end

  def test_should_have_the_author
    assert_equal "37signals", @atom_file.at("entry/author/name").inner_html
  end

  def test_should_have_the_content
    assert_match /ch01_What_is_Getting_Real.php/, @atom_file.at("entry/content").to_s
  end
end
