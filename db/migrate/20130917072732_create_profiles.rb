class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email      
      t.string :password
      t.timestamps
    end

    create_table :profiles do |t|
      t.belongs_to :user
      t.string :name
      t.integer :age
      t.text :about
      t.string :hometown
      t.string :currentcity
      t.string :occupation
      t.integer :contactno
      t.timestamps
    end

  end
end
