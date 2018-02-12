class AddMissingSeedToGermination < ActiveRecord::Migration
    def change
        add_column :germinations, :missingSeed, :integer
    end
end
