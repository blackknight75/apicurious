class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :token
      t.string :email
      t.string :image
      t.string :repos_url
      t.string :public_repos
      t.string :public_gists
      t.string :starred_url
      t.string :followers_url
      t.string :followers
      t.string :following_url
      t.string :following

      t.timestamps
    end
  end
end
