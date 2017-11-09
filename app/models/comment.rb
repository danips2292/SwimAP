class Comment < ApplicationRecord
	has_one :user
	scope :thisUserGroup, -> (user) {where(:user_id => user.id).  order(updated_at: :desc)}
end
