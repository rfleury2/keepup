require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should belong_to :user }

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :user }

  describe '#assign_follow_up' do
    let(:contact) { FactoryGirl.create(:contact) }

    it 'creating a contact assigns a follow up' do
      expect{contact}.to change{FollowUp.count}.by 1
    end
  end

  describe '#next_follow_up and date' do
    let!(:contact) { FactoryGirl.build(:contact) }

    before do
      FactoryGirl.create(:follow_up, contact: contact, send_date: Date.today + 10.days)
      FactoryGirl.create(:follow_up, contact: contact, send_date: Date.tomorrow)
      FactoryGirl.create(:follow_up, contact: contact, send_date: Date.today + 8.days)
    end

    it 'creating a contact assigns a follow up' do
      expect(contact.next_send_date).to eq Date.tomorrow
    end
  end

  describe 'email uniqueness scoped to the user' do
    let!(:user_1) { FactoryGirl.build(:user) }
    let!(:user_2) { FactoryGirl.build(:user) }
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
