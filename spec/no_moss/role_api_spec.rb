require 'spec_helper'

describe NoMoss::RoleApi do
  let(:missile_role) {
    described_class.new.tap{ |r|
      r.module_eval do ; implements :target, :launch, :explode ; end
    }
  }

  describe '.api_methods' do
    it "returns an array of the API methods of the role" do
      expect( missile_role.api_methods.sort_by(&:to_s) ).to eq([:explode, :launch, :target])
    end
  end

  describe '.methods_missing_from' do
    let(:object_class) { Class.new.tap { |c|
      object_methods.each do |m| ; c.send(:define_method, m) { } ; end
    } }
    let(:object) { object_class.new }

    describe "given an object that implements all the API methods" do
      let(:object_methods) { [:arm, :target, :launch, :explode] }

      it "returns an empty array" do
        expect( missile_role.methods_missing_from(object) ).to eq([])
      end
    end

    describe "given an object that doesn't implement all the API methods" do
      let(:object_methods) { [:arm, :launch] }

      it "returns an array of unimplemented method names" do
        expect( missile_role.methods_missing_from(object) ).to eq([:target, :explode])
      end
    end
  end

  describe ".restrict" do
    describe "returned object" do
      subject { missile_role.restrict(underlying_obj) }
      let(:underlying_obj) { double(:underlying_obj) }

      it "delegates API method calls to the underlying object, including blocks" do
        expect(underlying_obj).to receive(:target).with(:earth).and_yield :something
        yielded = nil
        subject.target :earth do |v| ; yielded = v ; end
        expect( yielded ).to eq(:something)
      end

      it "does not delegate non-API calls" do
        allow(underlying_obj).to receive(:foo)
        expect( lambda{ subject.foo } ).to raise_exception(NoMoss::NoRoleApiMethodError)
      end
    end
  end
end
