class List < ApplicationRecord
  validates :task, presence: true
  validates :limit, presence: true
  belongs_to :user
end
