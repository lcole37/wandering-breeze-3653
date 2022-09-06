class Project < ApplicationRecord
  validates_presence_of :name, :material

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects
  belongs_to :challenge

  def theme
    self.challenge.theme
  end

  def number_of_contestants
    contestants = self.contestants
    contestants.count
  end
end
