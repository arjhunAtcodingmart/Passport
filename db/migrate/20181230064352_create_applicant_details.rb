class CreateApplicantDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :applicant_details do |t|
      t.string :first_name
      t.string :surname
      t.string :other_names
      t.string :name_changed
      t.datetime :dob
      t.string :city
      t.string :select_country
      t.string :select_state
      t.string :select_district
      t.string :select_gender
      t.string :select_marital
      t.string :select_citizenship
      t.string :select_employment
      t.string :select_gov_servant
      t.string :select_qualification
      t.string :select_non_e_c_r
      t.string :aadhaar_number
      t.string :voter_id
      t.string :pan_id
      t.integer :service_id

      t.timestamps
    end
  end
end
