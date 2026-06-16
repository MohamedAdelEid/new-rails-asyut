class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'creator_id', dependent: :destroy
end
