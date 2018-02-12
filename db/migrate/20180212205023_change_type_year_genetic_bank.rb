class ChangeTypeYearGeneticBank < ActiveRecord::Migration
    def change
        change_column :genetic_banks, :year, :integer
    end
end
