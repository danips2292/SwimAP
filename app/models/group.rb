class Group < ApplicationRecord
	has_many :users
	has_many :assistances
	has_many :posts
	GROUP_TYPE = ['Regular', 'Equipo']

end
