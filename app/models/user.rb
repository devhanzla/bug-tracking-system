class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :creator_id_bugs, class_name: "Bug", foreign_key: "creator_id"
  has_many :solver_id_bugs, class_name: "Bug", foreign_key: "solver_id"

  has_many :created_projects, class_name: "Project", foreign_key: "manager_id"

  has_and_belongs_to_many :projects

  def manager?
    user_type == 'Manager'
  end
end
