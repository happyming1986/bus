class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, comment: '内容'
      t.references :author, index: true, comment: '评论者'
      t.references :article, index: true, comment: '对应的文章'

      t.timestamps
    end
  end
end
