class RemoveSpecialtyFromDoctors < ActiveRecord::Migration[6.0]
  def change
    remove_column :doctors, :specialty
  end
end
