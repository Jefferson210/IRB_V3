class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|

      t.timestamps null: false
    end
  end
end
class CreateSeeds < ActiveRecord::Migration
    def change
        create_table :seeds do |t|
            t.date :sowDate, null: false
            t.string :origin
            t.integer :numSeeds
            t.decimal :totalWeight, precision:5 , scale:2
            t.integer :week
            t.string :hydratation
            t.string :status
            t.date :dateOut
            t.integer :totalGermination
            t.decimal :percentageGermination, precision:5 , scale:2
            t.string :germination

            t.timestamps null: false
        end
    end
end
