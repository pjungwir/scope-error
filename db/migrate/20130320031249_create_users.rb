class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
    create_table :projects do |t|
      t.references :user
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :projects
  end
end
