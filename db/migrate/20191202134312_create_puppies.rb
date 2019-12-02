class CreatePuppies < ActiveRecord::Migration[5.2]
  def change
    create_table :puppies do |t|
      t.string :name
      t.date :birthdate
      t.string :breed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
