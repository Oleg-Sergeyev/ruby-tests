# frozen_string_literal: true

RSpec.describe 'Массив в Ruby' do
  let(:empty_arr) { [] }
  it_behaves_like 'Enumerable', Array

  context 'при обращении к квадратным скобкам', enumerable: true do
    let(:arr) { [1, 2, 3, 4, 5] }
    it 'можно извлекать значения по индексу' do
      expect(arr).to respond_to :[]
      expect(arr[0]).to eq 1
      expect(arr[-1]).to eq 5
    end
    it 'можно перезаписывать элементы по индексу' do
      arr[3] = 15
      expect(arr[3]).to eq 15
    end
    it 'можно создавать элементы' do
      expect(empty_arr).to respond_to :[]=
      empty_arr[3] = 15
      expect(empty_arr[3]).to be 15
      expect(empty_arr.size).to be 4
    end
  end
  context 'при обращении к методу', enumerable: true do
    it(:to_ary) { expect(empty_arr).to respond_to :to_ary }
  end
end
