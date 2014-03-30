require 'spec_helper'

describe "StaticPages" do

  let (:base_title) {"This is our awesome app"}
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "should the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title}")
    end

    it "shoulnd have | Home" do
      visit '/static_pages/home'
      expect(page).not_to have_title("| Home")
    end
  end

  describe "Help Page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have Help in a title" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title}  | Help")
    end
  end


  describe "About Page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have About in a title" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About")
    end
  end

  describe "Contact Page" do
    it "should have the content 'Contact Info'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact Info')
    end

    it "should have Contact in a title" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title}  | Contact")
    end
  end
end
