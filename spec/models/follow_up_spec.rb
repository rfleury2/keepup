require 'rails_helper'

RSpec.describe FollowUp, type: :model do
  it { should belong_to :contact }
  
  it { should validate_presence_of :send_date }
end
