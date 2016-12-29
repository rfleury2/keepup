class Contact < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :email
  validates_uniqueness_of :email, scoped_to: "User"
end
