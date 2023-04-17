class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      #idはマイグレーションファイルに記載なくても必ず作成される？
      #t.integer :id
      t.string :title
      t.text :opinion
      t.integer :user_id
      t.timestamps
    end
  end
end
