class AddPkToTables < ActiveRecord::Migration
    def change
        add_column :seeds, :crossing_id, :integer, after: :id
        add_column :germinations, :seed_id, :integer, after: :id
        add_column :one_offsprings, :germination_id, :integer, after: :id
        add_column :two_offsprings, :one_offspring_id, :integer, after: :id
        add_column :three_offsprings, :two_offspring_id, :integer, after: :id
        add_column :irb_selections, :three_offspring_id, :integer, after: :id
    end
end
