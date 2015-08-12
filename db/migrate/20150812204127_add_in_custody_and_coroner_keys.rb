class AddInCustodyAndCoronerKeys < ActiveRecord::Migration
  def change
    add_column :incidents, :coroner_case_number, :string
    add_column :incidents, :in_custody_record_key_number, :string
  end
end
