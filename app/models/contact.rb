class Contact < ActiveRecord::Base
  belongs_to :user, required: true

  validates_presence_of :name, :email
  validates_uniqueness_of :email, scope: :user
end
