class RankingLine < ApplicationRecord
	has_one :user
	STYLES = ["Libre", "Dorso", "Pecho", "Mariposa", "Combinado"]
    DISTANCES = ["25m", "50m", "100m", "200m", "400m", "800m", "1000m" , "2000m"]
    
	
end
