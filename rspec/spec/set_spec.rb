# frozen_string_literal: true

require 'set'

RSpec.describe Set do
  let(:set) { Set[1, 2, 5, 4] }

  context 'объект Set', :lesson do
    it 'возвращает уникальное множество' do
      expect(Set[1, 2, 2]).to be_unique
    end
  end

  context 'объект Set позволяет', :lesson do
    it 'добавлять в себя массив или другое множество' do
      expect(set.add?([3, 4])).to be_truthy
      expect(set.add?(Set[3, 4])).to be_truthy
    end
    it 'добавлять элементы с помощью оператора <<' do
      expect(set).to respond_to :<<
      expect((set << 7).to_a.sort).to eq [1, 2, 4, 5, 7]
    end
    it 'оператор << изменяет массив' do
      expect { set << 9 }.to change { set.size }.by(1)
    end
    it "добавлять элементы с помощью оператора | 'union'" do
      expect(set).to respond_to :|
      expect((set | (1..6)).to_a.sort).to eq [1, 2, 3, 4, 5, 6]
    end
    it 'принимать блок методов each, reject!' do
      expect { |block| set.each(&block) }.to yield_control
      expect { |block| set.reject!(&block) }.to yield_control
    end
  end
end
