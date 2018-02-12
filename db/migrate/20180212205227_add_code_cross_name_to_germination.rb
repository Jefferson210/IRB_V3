class AddCodeCrossNameToGermination < ActiveRecord::Migration
    def change
        add_column :germinations, :codeCross, :string
        add_column :germinations, :codeCrossNumRepeat, :string
    end
end
