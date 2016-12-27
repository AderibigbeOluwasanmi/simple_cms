class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string 'first_name', :limit => 25
      t.string 'last_name'
      t.string 'email', :default => '', :null => false
      t.string 'password', :limit => 40

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
