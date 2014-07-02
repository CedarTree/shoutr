class User < ActiveRecord::Base
  has_many :shouts

  has_many :followed_user_relationships,
  class_name: "FollowingRelationship",
  foreign_key: :follower_id

  has_many :followed_users,
  through: :followed_user_relationships

  has_many :follower_relationships,
  class_name: "FollowingRelationship",
  foreign_key: :followed_user_id

  has_many :followers,
  through: :follower_relationships

  def follow(other_user)
    followed_users << other_user
  end

  def unfollow(other_user)
    followed_users.destroy(other_user)
  end

  def following?(other_user)
    followed_user_ids.include?(other_user.id)
  end

  def followed_shouts 
    ppl_shouted = []
    followed_users.each do |user|
     user.shouts.each do |shout|
      ppl_shouted << shout
     end
    end
    ppl_shouted.sort_by {|shout| shout.created_at}
  end
end
