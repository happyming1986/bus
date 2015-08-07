class Resource
  include Resourcing

  # 文章
  group :articles do
    pow do
      Article.all.limit(10)
    end
    source :read, Article do |user, obj|
      false
    end
    source [ :approve, :decline, :freeze, :finish, :renew, :deposit_margin ], Article
  end

  # 评论
  group :comments do
    pow do
      Comment.all.limit(1)
    end
    source [ :read, :update, :destroy ], Comment do |user, obj|
      false
    end
    source :create, Comment
  end

end