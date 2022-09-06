require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe 'class methods' do
    before :each do
      @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
      @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)

      @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")
      @lit_fit = @furniture_challenge.projects.create!(name: "Litfit", material: "Lamp")
    end

    describe 'theme' do
      it "returns challenge theme" do
        expect(@lit_fit.theme).to eq("Apartment Furnishings")
      end
    end
  end
end
