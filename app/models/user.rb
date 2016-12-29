class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :contacts

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email

  def full_name
    "#{first_name} #{last_name}" 
  end
end
