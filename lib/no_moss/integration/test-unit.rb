require "no_moss/custom_matchers"

module NoMoss
  module Integration
    module TestUnitAssertions
      def assert_plays_role(expected_role, actual)
        matcher = NoMoss::CustomMatchers::PlayRole.new(expected_role)
        predicate = matcher.matches?(actual)
        message = matcher.failure_message_for_should
        assert predicate, message
      end
    end
  end
end

module Test
  module Unit
    class TestCase
      include NoMoss::Integration::TestUnitAssertions
    end
  end
end
