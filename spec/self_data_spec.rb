describe SelfData do
  let(:test_var) { 'test_value' }

  let(:data) { SelfData.load(context: binding) }

  it { expect(data).to eq(key1: 4, key2: 'test_value') }
end

__END__
:key1: <%= 2*2 %>
:key2: <%= test_var %>
