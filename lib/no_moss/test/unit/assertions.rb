module NoMoss
  module Test
    module Unit
      module Assertions
        def assert_plays_role(role, actual)
          methods_missing = role.methods_missing_from(actual)
          unless methods_missing == []
            flunk <<-EOF
expected #{actual.inspect}
to play the role of #{role},
but it is missing the following method(s): #{methods_missing.join(', ')}
            EOF
          end
        end
      end
    end
  end
end

::Test::Unit::Assertions.module_eval do
  include NoMoss::Test::Unit::Assertions
end
