# frozen_string_literal: true

RSpec.describe Commit do
  context 'возвращает чило коммитов' do
    it :call do
      expect(described_class).respond_to? :call
    end
    it :call do
      VCR.use_cassette('commits', record: :once) do
        expect(described_class.call).to eq 18
      end
    end
  end
end
