class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new(id: params[:id])
  end

  def create
    @contact = Contact.new(category_params)
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      comments = params[:contact][:comments]
      ContactMailer.contact_email(name, email, comments).deliver

      flash[:success] = "Message sent successfully."
      redirect_to new_contact_path
    else
      flash[:error] = @category.errors.full_messages.to_sentence
      render :new
    end
  end

  private
    def category_params
      params.require(:contact).permit(:name, :email, :comments, :id)
    end
end
