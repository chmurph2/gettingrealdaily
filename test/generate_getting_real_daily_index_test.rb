require "#{File.dirname(__FILE__)}/test_helper"
require "#{File.dirname(__FILE__)}/../generate_getting_real_daily_feed"

class GenerateGettingRealDailyIndexTest < Test::Unit::TestCase
  def setup
    write_index(0)
    @index_file = Hpricot(open("index.html"))
  end

  def test_should_calculate_the_first_essay_index_if_today_is_launch_date
    Date.stubs(:today).returns(Date.new(2009, 02, 23))
    assert_equal 0, calculate_essay_index
  end

  def test_should_calculate_the_last_essay_index_if_today_is_91_days_after_launch_date
    Date.stubs(:today).returns(Date.new(2009, 02, 23) + 91)
    assert_equal 90, calculate_essay_index
  end

  def test_should_calculate_the_first_index_if_today_is_92_days_after_launch_date
    Date.stubs(:today).returns(Date.new(2009, 02, 23) + 92)
    assert_equal 0, calculate_essay_index
  end

  def test_should_have_the_iframe
    assert_equal "http://#{GR37S_DOMAIN}/ch01_What_is_Getting_Real.php", @index_file.at("body/iframe").attributes['src']
  end
end