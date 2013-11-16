RSpec::Matchers.define :play_role do |role|
  match do |actual|
    @methods_missing = role.methods_missing_from(actual)
    @methods_missing == []
  end

  failure_message_for_should do |actual|
    <<-EOF
expected #{actual.inspect}
to play the role of #{role},
but it is missing the following method(s): #{@methods_missing.join(', ')}
    EOF
  end
end
