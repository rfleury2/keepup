class FollowUpCreator
  attr_reader :follow_up

  def initialize(contact)
    @contact = contact
    get_or_create_follow_up
  end

  private

  def get_or_create_follow_up
    @follow_up = @contact.follow_ups.create(send_date: get_send_date)
  end

  def get_send_date
    if @contact.follow_ups.empty?
      return Time.zone.today + increment
    else
      return @contact.next_follow_up.send_date + increment
    end
  end

  def increment
    7.days
  end
end