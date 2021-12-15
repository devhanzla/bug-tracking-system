class ProjectUser < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }

  belongs_to :manager, class_name: "User"

  has_many :bugs
  has_and_belongs_to_many :users
end
