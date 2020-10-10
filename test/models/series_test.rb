require 'test_helper'

class SeriesTest < ActiveSupport::TestCase
  test "should not save series without title" do
    series = Series.new
    assert_not series.save
  end

  test "series title can't be less than 3 chars" do
    series = Series.new(title: 'No')
    assert_not series.save
  end

  test "first letter of title is capitalized before saving series" do
    series = Series.new(title: 'this should be capitalized')
    series.save
    assert_equal('This should be capitalized', series.title)
  end
end
