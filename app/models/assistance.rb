class Assistance < ApplicationRecord
	has_one :group
	 scope :byGroupId, -> (id) { where(:group_id => id)}
end
