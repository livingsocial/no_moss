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

    it 'should know when an object does not play a role' do
      expect(cat).to_not play_role(Agriculture::Roles::Cattle)
    end
  end

  describe "shared examples" do
    describe Agriculture::Animals::Yak do
      include_examples "plays the role of", Agriculture::Roles::Cattle
    end
  end
end
