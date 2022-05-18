# frozen_string_literal: true

RSpec.shared_examples 'UserMethods' do |store_class|
  let(:user) { store_class.new(generate(:ru)) }
  context 'содержит методы', :lesson do
    it :email do
      expect(user).to respond_to :email
    end
    it :first_name do
      expect(user).to respond_to :first_name
    end
    it :last_name do
      expect(user).to respond_to :last_name
    end
    it :middle_name do
      expect(user).to respond_to :middle_name
    end
  end
end
