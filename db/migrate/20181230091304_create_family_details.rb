class CreateFamilyDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :family_details do |t|
      t.string :father_name
      t.string :father_surname
      t.string :guardian_name
      t.string :guardian_surname
      t.string :mother_name
      t.string :mother_surname
      t.integer :applicant_id

      t.timestamps
    end
  end
end
