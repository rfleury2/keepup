require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should belong_to :user }

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :user }

  describe 'email uniqueness scoped to the user' do
    let!(:user_1) { FactoryGirl.create(:user) }
    let!(:user_2) { FactoryGirl.create(:user) }
    let!(:contact) { FactoryGirl.create(:contact, email: 'person@person.com', user: user_1 )}

    it 'same user cannot create a second contact with same email' do
      new_contact = FactoryGirl.build(:contact, email: 'person@person.com', user: user_1)
      expect(new_contact).to_not be_valid
    end

    it 'different user can create a contact with same email' do
      new_contact = FactoryGirl.build(:contact, email: 'person@person.com', user: user_2)
      expect(new_contact).to be_valid
    end
  end
end
