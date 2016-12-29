require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }

  it { should validate_presence_of :password }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_confirmation_of(:password).on(:create) }

  it { should have_many :contacts }

  describe '#full_name' do
    let(:user) { FactoryGirl.build(:user, first_name: 'Joe', last_name: 'Schmo') }

    it 'should concatenate first_name and last_name' do
      expect(user.full_name).to eq "Joe Schmo"
    end
  end
end
