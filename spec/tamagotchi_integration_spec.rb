require('capybara/rspec')
require('sinatara')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the path to the pets status", {:type => :feature}) do
  it('will detect the presence of our root page') do
    visit('/')
    click_button('Click')
    expect(page).to have_content('Play')
  end
end
