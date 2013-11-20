module NoMoss
  module CustomMatchers
    class PlayRole
      attr_reader :expected_role, :actual

      def initialize(expected_role)
        @expected_role = expected_role
      end

      def matches?(actual)
        @actual = actual
        role_methods_missing_from_target.empty?
      end

      def failure_message_for_should
        <<-EOF
expected #{actual.inspect}
to play the role of #{expected_role},
but it is missing the following method(s): #{role_methods_missing_from_target.join(', ')}
        EOF
      end

      private

      def role_methods_missing_from_target
        expected_role.methods_missing_from(actual)
      end
    end

    module SpecHelpers
      def play_role(expected_role)
        PlayRole.new(expected_role)
      end
    end
  end
end

RSpec::configure do |config|
  include NoMoss::CustomMatchers::SpecHelpers
end
