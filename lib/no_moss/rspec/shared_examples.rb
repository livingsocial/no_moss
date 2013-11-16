shared_examples "plays the role of" do |role|
  it "plays the role of #{role}" do
    expect(subject).to play_role(role)
  end
end
