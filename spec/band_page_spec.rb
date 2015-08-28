require('spec_helper')

describe('the band funtionality', {:type => :feature}) do
  it('allows user to add a band') do
    visit('/')
    fill_in('name', with: "Smashing Pumpkins")
    click_button('Add Band')
    expect(page).to have_content('SMASHING PUMPKINS')
  end
end
