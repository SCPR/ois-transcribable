class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :incidents, :district_attorneyprepared_report, :district_attorney_prepared_report
  end
end
