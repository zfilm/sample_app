require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end
  
  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end
  
  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'About' }

    it_should_behave_like "all static pages"
  end
  
  describe "Jobs" do
    before { visit jobs_path }
    let(:heading)    { 'Jobs' }
    let(:page_title) { 'Jobs' }

    it_should_behave_like "all static pages"
  end
  
  describe "Contact" do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end

  it "should have the right link on the layout" do
    visit root_path
    page.first(:link, "About").click
    expect(page).to have_title(full_title('About Us'))
    page.first(:link, "Help").click
    expect(page).to have_title(full_title('Help'))
    page.first(:link, "Contact").click
    expect(page).to have_title(full_title('Contact'))
    page.first(:link, "Jobs").click
    expect(page).to have_title(full_title('Jobs'))
    page.first(:link, "Home").click
    page.first(:link, "Sign up now").click
    expect(page).to have_title(full_title('Sign up'))
    click_link "sample app"
    expect(page).to have_title(full_title(''))

  end
end