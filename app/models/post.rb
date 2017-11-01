class Post < ApplicationRecord
    validates :title, presence: true,length: { minimum: 5 }
    has_one :group

    scope :team , -> { where(:group_id => Group.where(:name => "Equipo").first.id).  order(updated_at: :desc)}
end
