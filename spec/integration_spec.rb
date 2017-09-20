require("./app")
require("capybara/rspec")

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add doctor to page', {:type=>:feature}) do
  it("it will add a doctor to doc page") do
    visit('/')
    click_link('Add a new doctor')
    fill_in('name', :with=>"Dr. House")
    fill_in('specialty', :with=> "M.D")
    click_button("Add Doctor")
    expect(page).to have_content("Dr. House")
  end
end
