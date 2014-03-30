require 'spec_helper'

describe "StaticPages" do

  let (:base_title) {"Awesome app and its"}
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "should have titile Home" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title} | Home page")
    end
  end

  describe "Help Page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have Help in a title" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title}  | Help page")
    end
  end


  describe "About Page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have About in a title" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About page")
    end
  end

  describe "Contact Page" do
    it "should have the content 'Contact Info'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact Info')
    end

    it "should have Contact in a title" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title}  | Contact page")
    end
  end
end
