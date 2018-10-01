class AddImageIdToOffsprings < ActiveRecord::Migration
    def change
        add_column :one_offsprings, :PictureId, :integer
        add_column :two_offsprings, :PictureId, :integer
        add_column :three_offsprings, :PictureId, :integer
    end
end
