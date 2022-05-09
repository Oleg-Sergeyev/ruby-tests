# frozen_string_literal: true

RSpec.shared_examples 'Enumerable' do |store_class|
  let(:empty_collection) { store_class.new }
  context 'при обращении к итертатору' do
    it(:each) { expect(empty_collection).to respond_to :each }
    it(:map) { expect(empty_collection).to respond_to :map }
    it(:select) { expect(empty_collection).to respond_to :select }
    it(:reject) { expect(empty_collection).to respond_to :reject }
    it(:reduce) { expect(empty_collection).to respond_to :reduce }
  end
end
