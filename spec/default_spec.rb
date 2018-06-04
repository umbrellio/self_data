# frozen_string_literal: true

describe "default converters (yaml and erb)" do
  subject { SelfData.load(context: binding) }

  let(:test_var) { "test_value" }

  it { is_expected.to eq(key1: 4, key2: "test_value") }
end

__END__
:key1: <%= 2*2 %>
:key2: <%= test_var %>
