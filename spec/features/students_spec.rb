require 'rails_helper'

feature "students" do
  before(:each) do
    DatabaseCleaner.clean
  end

  scenario "listing" do
    create_list(:student, 2)
    visit "/students"
    expect(page).to have_css("table tbody tr", count: 2)
  end

  context "creating" do
    background  do
      visit "/students"
    end
    scenario "successful" do
      click_on "New"
      fill_in "Nome", with: "John Doe"
      fill_in "Matrícula", with: "1024"
      fill_in "Status", with: "1"
      click_on "Criar Estudante"
      expect(page).to have_content("John Doe")
      expect(page).to have_content("1024")
    end

    scenario "failure" do
      click_on "New"
      fill_in "Nome", with: "John Doe"
      click_on "Criar Estudante"
      expect(page).to have_content("Statusnão pode ficar em branco")
      expect(page).to have_content("Matrículanão pode ficar em branco")
    end
  end

  context "updating" do
    background do
      student = create(:student)
      visit "/students"
      click_link "Edit"
    end

    scenario "successful" do
      fill_in "Nome", with: "Lex Luthor"
      click_on "Atualizar Estudante"
      expect(page).to have_content("Lex Luthor")
    end

    scenario "failure" do
      fill_in "Nome", with: ""
      click_on "Atualizar Estudante"
      expect(page).to have_content("Nomenão pode ficar em branco")
    end
  end

  context "deleting" do
    background do
      students = create_list(:student, 3)
      visit "/students"
      find(:xpath, '/html/body/div/div/table/tbody/tr[1]/td[4]/a[3]').click
    end

    scenario "successful", js: true do
      alert = page.driver.browser.switch_to.alert
      alert.accept
      expect(page).to have_css("table tbody tr", count: 2)
    end

    scenario "failure", js: true do
      alert = page.driver.browser.switch_to.alert
      alert.dismiss
      expect(page).to have_css("table tbody tr", count: 3)
    end
  end
end
