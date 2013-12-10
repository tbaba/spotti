class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false, uniq: true
      t.string :handle_name
      t.string :email, null: false, uniq: true
      t.string :uid, null: false, uniq: true
      t.string :provider
      t.string :access_token

      t.timestamps
    end
  end
end
