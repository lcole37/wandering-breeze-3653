require 'rails_helper'

RSpec.describe "As a visitor," do
  describe "When I visit a project's show page" do
    before :each do
      @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
      @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)

      @news_chic = @recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
      @boardfit = @recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes")

      @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")
      @lit_fit = @furniture_challenge.projects.create!(name: "Litfit", material: "Lamp Shade")

      @jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      @kentaro = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      @erin = Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

      ContestantProject.create!(contestant_id: @jay.id, project_id: @lit_fit.id)
      ContestantProject.create!(contestant_id: @gretchen.id, project_id: @lit_fit.id)
      ContestantProject.create!(contestant_id: @kentaro.id, project_id: @lit_fit.id)

      visit "/projects/#{@lit_fit.id}"
    end

    it "I see that project's name and material" do
      expect(page).to have_content("Litfit")
      expect(page).to have_content("Material: Lamp Shade")
    end

    it "And I also see the theme of the challenge that this project belongs to." do
      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    end
          #user story 3
    it "I see a count of the number of contestants on this project" do
      expect(page).to have_content("Number of Contestants: 3")
    end
  end
end
