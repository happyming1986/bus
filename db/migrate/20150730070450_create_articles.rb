class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, comment: '标题'
      t.text :content, comment: '内容', limit: 4294967295 # LongText
      t.references :author, index: true, comment: '作者'

      t.timestamps
    end
  end
end
