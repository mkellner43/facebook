class AddDobToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :dob, :date
  end
end
