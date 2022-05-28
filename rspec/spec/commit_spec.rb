# frozen_string_literal: true

RSpec.describe Commit do
  it :call do
    expect(described_class).to respond_to(:call)
  end

  context 'число коммитов' do
    before do
      json = Array.new(18) { {} }
      allow(JSON).to receive(:parse).and_return(json)
    end
    it :call do
      expect(described_class.call).to eq 18
    end
  end
end
