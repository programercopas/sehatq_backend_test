class CreateScedules < ActiveRecord::Migration[6.0]
  def change
    create_table :scedules do |t|
      t.integer  :hospital_id
      t.integer  :doctor_id
      t.datetime  :scedule_time

      t.timestamps
    end
  end
end
