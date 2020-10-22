class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :search]

  # GET /contacts
  # GET /contacts.json
  def index
    if params[:search].present?
      @contacts = Contact.where("first_name LIKE ?" , "%#{params[:search]}%").or(Contact.where("last_name LIKE ?", "%#{params[:search]}%"))
    else
      @contacts = Contact.all
    end
  end

  def search
    @parameter = params[:first_name]
    @contacts = Contact.all.where("first_name LIKE ?" , search: @parameter)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :mobile, :gender, :street_address, :city, :state, :country, :zip_code)
      #:gender, :street_address, :city, :state, :country, :zip_code
    end
end
