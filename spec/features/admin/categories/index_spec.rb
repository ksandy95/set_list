require "rails_helper"

RSpec.describe "User visits categories index page" do
  context "as admin" do
    before :each do
      admin = User.create(username: "penelope",
                         password: "boom",
                         role: 1)

       allow_any_instance_of(ApplicationController).to \
        receive(:current_user).and_return(admin)
    end

    it "allows admin to see all categories" do
      visit admin_categories_path
      expect(page).to have_content("Admin Categories")
    end

    it "allows admin to delete categories"
  end

  context "as default user" do
    it 'does not allow default user to see admin categories index' do
      user = User.create(username: "fern@gully.com",
                         password: "password")

      allow_any_instance_of(ApplicationController).to \
        receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  context "as a visitor" do
    it "does not allow visitor to see admin categories" do
      visit admin_categories_path

      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
