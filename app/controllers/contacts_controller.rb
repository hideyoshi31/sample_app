class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      UserMailer.submit_email(@contact).deliver
      flash[:success] = "Submit contents!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :age, :content)
    end
end
