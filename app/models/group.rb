class Group < ApplicationRecord
	has_many :users , :dependent => :nullify
	has_many :assistances, :dependent => :nullify
	has_many :posts ,:dependent => :nullify
	has_many :documents, :dependent => :nullify
	GROUP_TYPE = ['Regular', 'Equipo']

end
