class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = current_user.contacts
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.json { render json: @contact.to_json(methods: :next_send_date), status: 201 }
      else
        format.json { render json: { errors: @contact.errors.full_messages }, status: 422 }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name)
  end
end