class List < ApplicationRecord
  validates :task, presence: true
  validates :date, presence: true
  belongs_to :user
end
