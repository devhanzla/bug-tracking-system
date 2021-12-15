class Bug < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :deadline, presence: true
  validates :bug_type, presence: true
  validates :status, presence: true

  belongs_to :project
  belongs_to :creator, class_name: "User"
  belongs_to :solver, class_name: "User"
end
