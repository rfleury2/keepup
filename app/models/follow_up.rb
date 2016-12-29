class FollowUp < ActiveRecord::Base
  belongs_to :contact

  validates_presence_of :send_date
end
