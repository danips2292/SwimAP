class AssistancesUser < ApplicationRecord
  belongs_to :user
  belongs_to :assistance
end
