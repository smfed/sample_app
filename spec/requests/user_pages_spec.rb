require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "profile page" do

    let(:test_user) { FactoryGirl.create(:user) }
    before { visit user_path(test_user) }

    it { should have_content(test_user.name) }
    it { should have_title(test_user.name) }
    it { should_not have_selector("div.alert.alert-success", text:"Добро пожаловать")}

  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

    describe "after submission" do
      before {click_button submit}

      it {should have_title(full_title("Sign up"))}
      it {should have_content("The form contains")}

    end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "t@user.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before {click_button submit}
        let(:user) {User.find_by(email: "t@user.com")}

        it {should have_title (user.name)}
        it {should have_link ("Sign out")}
        it {should have_selector("div.alert.alert-success", text:"Добро пожаловать")}

      end

    end


  end

end
