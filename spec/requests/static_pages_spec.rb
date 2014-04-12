require 'spec_helper'

describe "StaticPages" do
  subject  { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home Page" do
    before { visit root_path }

    let (:heading) {'Likenstrike.Me'}
    let (:page_title) {''}

    it_should_behave_like "all static pages"
    it {should_not have_title("| Home")}
  end

  describe "Help page" do
    before { visit help_path }

    let (:heading) {'Help'}
    let (:page_title) {'Help'}

    it_should_behave_like "all static pages"

  end

  describe "Recent Bets" do
    before { visit recent_path }

    let (:heading) {'Recent Bets'}
    let (:page_title) {'Recent Bets'}

    it_should_behave_like "all static pages"

  end

  describe "About page" do
    before { visit about_path }

    let (:heading) {'About'}
    let (:page_title) {'About'}

    it_should_behave_like "all static pages"

  end

  describe "Contact page" do
    before { visit contact_path }
    let (:heading) {'Contact'}
    let (:page_title) {'Contact'}

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    check_links link: "About", page: "About"
    check_links link: "Help", page: "Help"
    check_links link: "Contact", page: "Contact"
    check_links link: "Home", page: ""
    check_links link: "likenstrike.me", page: ""
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end
