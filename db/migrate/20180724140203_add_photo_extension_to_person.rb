class AddPhotoExtensionToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :extension, :string
  end
end
