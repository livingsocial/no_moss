require "no_moss/custom_matchers"

module NoMoss
  module Integration
    module RSpecMatchers
      def play_role(expected_role)
        NoMoss::CustomMatchers::PlayRole.new(expected_role)
      end
    end
  end
end

RSpec::configure do |config|
  include NoMoss::Integration::RSpecMatchers
end

shared_examples "plays the role of" do |role|
  it "plays the role of #{role}" do
    expect(subject).to play_role(role)
  end
end
