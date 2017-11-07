class Assistance < ApplicationRecord
	has_one :group

	def self.search(group_id)
		where(group_id: group_id)		
	end

end
