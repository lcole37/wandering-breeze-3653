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

  def average_customer_experience
    total_years = 0
    self.contestants.each do |contestant|
      total_years += contestant.years_of_experience
    end
    average = total_years / number_of_contestants
    return average
  end
end
