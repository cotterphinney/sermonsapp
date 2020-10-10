require 'test_helper'

class SermonTest < ActiveSupport::TestCase
  test "should not save sermon without title" do
    sermon = Sermon.new
    assert_not sermon.save
  end

  test "sermon title can't be less than 3 chars" do
    sermon = Sermon.new(title: 'No')
    assert_not sermon.save
  end

  test "first letter of title is capitalized before saving sermon" do
    sermon = Sermon.new(title: 'this should be capitalized')
    sermon.save
    assert_equal('This should be capitalized', sermon.title)
  end
end
