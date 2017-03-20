class DropTranscriptionTable < ActiveRecord::Migration
    def up
      drop_table :transcriptions
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end

end
