class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :gender
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      
      t.timestamps
    end
  end
end
