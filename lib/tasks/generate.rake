namespace :generate do
  desc '批量生成示例数据'
  task create_show_data: :environment do
    20.times do
      User.create(email: FFaker::Internet.free_email, password: '12345678')
    end
    100.times do
      Article.create(content: FFaker::LoremCN.paragraphs, title: FFaker::LoremCN.word, author_id: rand(1...20))
    end
  end
end
