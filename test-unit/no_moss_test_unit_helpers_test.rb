require_relative 'test_helper'

require 'no_moss/integration/test-unit'
require_relative '../spec/support/no_moss_tests'

class NoMossTestHelpersTest < Test::Unit::TestCase
  def test_assert_plays_role
    yak = NoMossTests::Agriculture::Animals::Yak.new
    assert_plays_role NoMossTests::Agriculture::Roles::Cattle, yak
  end
end
