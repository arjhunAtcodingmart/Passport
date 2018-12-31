class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :select_type
      t.string :type_of_application
      t.string :type_of_passport
      t.string :validity

      t.timestamps
    end
  end
end
