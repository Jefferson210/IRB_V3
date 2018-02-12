class AddFkToTables < ActiveRecord::Migration
    def change
        add_foreign_key :seeds, :crossings
        add_foreign_key :germinations, :seeds
        add_foreign_key :one_offsprings, :germinations
        add_foreign_key :two_offsprings, :one_offsprings
        add_foreign_key :three_offsprings, :two_offsprings
        add_foreign_key :irb_selections, :three_offsprings
    end
    execute "ALTER TABLE crossings ADD CONSTRAINT fk_father_id FOREIGN KEY (`father_id`) REFERENCES genetic_banks(`id`);"
    execute "ALTER TABLE crossings ADD CONSTRAINT fk_mother_id FOREIGN KEY (`mother_id`) REFERENCES genetic_banks(`id`);"
end
