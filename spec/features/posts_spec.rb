require 'rails_helper'


RSpec.describe Post, type: :model do
  describe 'navigate' do
    before do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post)
      login_as(@user, :scope => :user)
    end

    feature 'index' do

      it 'can be reached successfully' do
        visit posts_path
        expect(page.status_code).to eq(200)
      end

      it 'has a title of Posts' do
        visit posts_path
        expect(page).to have_content(/How to install rspec/)
      end
    end

  end

  feature 'creation' do

    before do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
      visit new_post_path
    end
    
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form' do
     
      fill_in 'post[description]', with: "How to install ruby gem."
      fill_in 'post[code]', with: "bundle install"
      select('Rails', :from => 'post[category]')

      click_on "Save"

      expect(page).to have_content("How to install ruby gem.")
    end

    it "will have a user associated with the post" do
   
      fill_in 'post[description]', with: "How to install ruby gem."
      fill_in 'post[code]', with: "update"
      select('Rails', :from => 'post[category]')
      click_on "Save"

      expect(@user.posts.last.code).to eq("update")
    end

  end
  
end