class Contestant < ApplicationRecord
  validates_presence_of :name, :age, :hometown, :years_of_experience

  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def projects
    name_list = []
    self.contestant_projects.each do |ct|
      name_list << ct.project.name
    end
    return name_list.join(", ")
  end

end
