class Contact < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :follow_ups

  validates_presence_of :name, :email
  validates_uniqueness_of :email, scope: :user

  after_create :assign_follow_up

  # TODO: test
  def assign_follow_up
    FollowUpCreator.new(self)
  end

  # TODO: test
  def next_follow_up
    follow_ups.order(:send_date).first
  end

  def next_send_date
    next_follow_up.try(:send_date)
  end
end
