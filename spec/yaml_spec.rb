# frozen_string_literal: true

describe "json converter" do
  subject { SelfData.load(:yaml) }

  it { is_expected.to eq(alias: "world", hello: "world") }
end

__END__
:alias: &alias "world"
:hello: *alias
