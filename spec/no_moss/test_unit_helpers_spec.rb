require 'spec_helper'
require 'test/unit'
require 'no_moss/test/unit/assertions'

describe ::Test::Unit::Assertions do
  let(:test_unit_context){ Object.new.tap{ |o|
    class << o ; include ::Test::Unit::Assertions ; end
  } }

  describe "#assert_plays_role" do
    it "Passes when the actual object plays the expected role" do
      animal = Agriculture::Animals::Yak.new
      test_unit_context.assert_plays_role Agriculture::Roles::Cattle, animal
    end

    it "Flunks when the actual object doesn't play the expected role" do
      animal = Agriculture::Animals::Cat.new
      expect{
        test_unit_context.assert_plays_role Agriculture::Roles::Cattle, animal
      }.to raise_exception(::Test::Unit::AssertionFailedError)
    end
  end
end
