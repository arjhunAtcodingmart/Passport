class CreateAddressDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :address_details do |t|
      t.string :address_same
      t.string :address_in_out
      t.string :address
      t.string :mobile_number
      t.string :telephone_number
      t.string :email
      t.string :first_refer_address
      t.string :first_refer_mobile_number
      t.string :first_refer_telephone_number
      t.string :second_refer_address
      t.string :second_refer_mobile_number
      t.string :second_refer_telephone_number
      t.integer :applicant_id

      t.timestamps
    end
  end
end
