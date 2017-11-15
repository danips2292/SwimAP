class RankingLine < ApplicationRecord
	has_one :user
	STYLES = ["Libre", "Dorso", "Pecho", "Mariposa", "Combinado"]
	DISTANCES = ["25m", "50m", "100m", "200m", "400m", "800m", "1000m" , "1500", "2000m", "5000m"]
	
	def self.search(distance,style)
		if style.nil? 
			where("distance LIKE ?", "%#{search}%")
		elsif distance.nil?
			where("style LIKE ?", "%#{search}%")
		else
			where(['distance LIKE ? AND style LIKE ?' , "%#{distance}%", "%#{style}%"])
		end	
		#where("distance LIKE ?", "%#{search}%") 
		#where("style LIKE ?", "%#{search}%")
	end

end
