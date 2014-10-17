class CreateActivities < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :auth_token
      t.datetime :oauth_expires_at
      t.string :email
      t.timestamps
    end

    create_table :activities do |t|
      t.string :description
      t.datetime :date_entered
      t.datetime :date_done
      t.integer :minutes

      t.integer :user_id
      t.foreign_key :users, dependent: :delete
      t.timestamps
    end
  end
end
