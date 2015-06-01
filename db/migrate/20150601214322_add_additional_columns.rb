class AddAdditionalColumns < ActiveRecord::Migration
    def change
        add_column :incidents, :case_relevant, :boolean, :null => false, :default => true
        add_column :incidents, :victim_arrested, :boolean, :null => false, :default => false
        add_column :incidents, :victim_case_number, :text
        add_column :incidents, :officer_special_unit, :text
        add_column :incidents, :officer_charges_filed, :boolean, :null => false, :default => false
        add_column :incidents, :officer_charges_filed_yes_detail, :text
    end
end
