class AddVerifierToIncident < ActiveRecord::Migration
  def change
  	add_column :incidents, :email, :string
  end
end
