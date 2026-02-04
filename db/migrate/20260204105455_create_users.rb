class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :human_id

      t.timestamps
    end

    add_index :users, :human_id, unique: true
  end
end
