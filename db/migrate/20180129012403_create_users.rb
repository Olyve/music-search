class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :spotify_token
      t.string :apple_music_token

      t.timestamps
    end
  end
end
