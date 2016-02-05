require 'rails_helper'

feature "classrooms" do
  before(:each) do
    DatabaseCleaner.clean
  end

  scenario "listing", js: true do
    create_list(:classroom, 3)
    visit "/"
    expect(page).to have_css("table tbody tr", count: 3)
  end

  context "creating", js: true do
    background do
      create_list(:student, 2)
      create_list(:course, 5)
      create(:course, name: "English")
      create(:student, name: "John Doe")
      visit "/"
    end
    scenario "successful" do
      page.select("English", :from => "selectCourse")
      page.select("John Doe", :from => "selectStudent")
      click_on "Add Classroom"
      expect(page).to have_css("table tbody tr", count: 1)
    end
  end
end
