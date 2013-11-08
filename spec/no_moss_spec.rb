require 'spec_helper'

describe NoMoss do
  it 'should have a version number' do
    NoMoss::VERSION.should_not be_nil
  end

  describe '.define_role' do
    it "defines a role that implements specific methods" do
      role = NoMoss.define_role do
        implements :foo, :bar
        implements :baz
      end

      expect( role.api_methods.sort_by(&:to_s) ).to eq([:bar, :baz, :foo])
    end
  end
end
