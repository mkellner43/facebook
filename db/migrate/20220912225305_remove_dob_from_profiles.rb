class RemoveDobFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :dob, :string
  end
end
