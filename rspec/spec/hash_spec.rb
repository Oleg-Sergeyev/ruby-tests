# frozen_string_literal: true

RSpec.describe 'Хэш в Ruby' do
  let(:empty_hash) { {} }
  it_behaves_like 'Enumerable', Hash

  context 'при обращении к квадратным скобкам', :enumerable do
    let(:hsh) { { first: :hello, second: :world } }
    it 'можно извлекать значения по ключу' do
      expect(hsh).to respond_to :[]
      expect(hsh[:first]).to eq :hello
    end
    it 'можно перезаписывать элементы по ключу' do
      hsh[:first] = :new_value
      expect(hsh[:first]).to eq :new_value
    end
    it 'можно создавать элементы' do
      expect(empty_hash).to respond_to :[]=
      empty_hash[:third] = :new_value
      expect(empty_hash[:third]).to be :new_value
      expect(empty_hash.size).to be 1
    end
  end
  context 'при обращении к методу', :enumerable do
    it(:to_hash) { expect(empty_hash).to respond_to :to_hash }
  end
end
