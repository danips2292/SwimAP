class Post < ApplicationRecord
    validates :title, presence: true,length: { minimum: 5 }
    has_one :group
    scope :thisUserGroup, -> (user) {where(:group_id => Group.where(:id => user.group_id).first.id).  order(updated_at: :desc)}
    scope :team , -> { where(:group_id => Group.where(:name => "Equipo").first.id).  order(updated_at: :desc)}
end
