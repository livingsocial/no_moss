require 'spec_helper'

require 'no_moss/rspec/all'
require_relative '../support/no_moss_tests'

describe 'RSpec helpers' do
  let(:yak)    { NoMossTests::Agriculture::Animals::Yak.new }
  let(:cat)    { NoMossTests::Agriculture::Animals::Cat.new }

  describe "custom matcher" do
    it 'should know when an object plays a role' do
      expect(yak).to play_role(NoMossTests::Agriculture::Roles::Cattle)
    end

    it 'should have a reasonable error message when an object does not play a role' do
      caught_exception = nil
      begin
        expect(cat).to play_role(NoMossTests::Agriculture::Roles::Cattle)
      rescue RSpec::Expectations::ExpectationNotMetError => e
        caught_exception = e
      end
      expect(caught_exception.message).to include("to play the role of NoMossTests::Agriculture::Roles::Cattle")
      expect(caught_exception.message).to include("but it is missing the following method(s): moo, low, grunt")
    end
  end

  describe "shared examples" do
    describe NoMossTests::Agriculture::Animals::Yak do
      include_examples "plays the role of", NoMossTests::Agriculture::Roles::Cattle
    end
  end
end
