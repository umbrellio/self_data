describe SelfData do
  let(:test_var) { 'test_value' }

  subject { SelfData.load(context: binding) }

  it { is_expected.to eq(key1: 4, key2: 'test_value') }
end

__END__
:key1: <%= 2*2 %>
:key2: <%= test_var %>
