class AddImageIdToGeneticBanks < ActiveRecord::Migration
    def change
        add_column :genetic_banks, :PictureId, :integer
    end
end
