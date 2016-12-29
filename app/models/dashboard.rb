class Dashboard
  attr_reader :user
  
  def initialize(user)
    @user = user
  end

  def upcoming_contacts(limit = 5)
    contacts.limit(limit)
  end

  def has_no_contacts?
    contacts.empty?
  end

  def contact_count
    contacts.count
  end

  private 

  def contacts 
    @contacts ||= @user.contacts
  end
end