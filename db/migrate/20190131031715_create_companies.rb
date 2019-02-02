class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.text :address
      t.text :peopleContact
      t.text :mission
      t.text :vision
      t.string :phone
      t.string :cellPhone
      t.string :facebookContact
      t.string :email
      t.string :skypeContact
      t.string :webContact

      t.timestamps null: false
    end
  end
end
