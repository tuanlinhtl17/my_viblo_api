class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :belongs_to_post, ->(post_id){where post_id: post_id} 
end
