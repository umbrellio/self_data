describe 'json converter' do
  subject { SelfData.load(:json) }

  it { is_expected.to eq("hello" => "goodbye") }
end

__END__
{"hello": "goodbye"}
