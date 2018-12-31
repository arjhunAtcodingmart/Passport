class CreateOtherDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :other_details do |t|
      t.string :passport_num
      t.datetime :doi
      t.datetime :doe
      t.string :poi
      t.string :passport_issue
      t.string :charged
      t.string :offence
      t.string :denied
      t.string :revoked
      t.string :political_asylum
      t.string :ec
      t.string :place
      t.string :date
      t.integer :applicant_id

      t.timestamps
    end
  end
end
