class AddPhotoToPuppy < ActiveRecord::Migration[5.2]
  def change
    add_column :puppies, :photo, :string
  end
end
