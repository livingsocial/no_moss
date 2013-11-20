require 'spec_helper'

require 'no_moss/rspec/all'

module Agriculture
  module Roles
    Cattle = NoMoss.define_role do
      implements :moo, :low
      implements :grunt
    end
  end
  
  module Animals
    class Yak
      def moo   ; "Mooooooooo" ; end
      def low   ; "Mooooooooo" ; end
      def grunt ; "hmph"       ; end
    end

    class Cat
      def meow ; "Meow"      ; end
      def purr ; "Purrrrr"   ; end
      def claw ; "*scratch*" ; end
      def destroy_furniture
        meow; purr; claw
      end
    end
  end
end


describe 'RSpec helpers' do
  let(:yak)    { Agriculture::Animals::Yak.new }
  let(:cat)    { Agriculture::Animals::Cat.new }

  describe "custom matcher" do
    it 'should know when an object plays a role' do
      expect(yak).to play_role(Agriculture::Roles::Cattle)
    end

    it 'should have a reasonable error message when an object does not play a role' do
      caught_exception = nil
      begin
        expect(cat).to play_role(Agriculture::Roles::Cattle)
      rescue RSpec::Expectations::ExpectationNotMetError => e
        caught_exception = e
      end
      expect(caught_exception.message).to include("to play the role of Agriculture::Roles::Cattle")
      expect(caught_exception.message).to include("but it is missing the following method(s): moo, low, grunt")
    end
  end

  describe "shared examples" do
    describe Agriculture::Animals::Yak do
      include_examples "plays the role of", Agriculture::Roles::Cattle
    end
  end
end
