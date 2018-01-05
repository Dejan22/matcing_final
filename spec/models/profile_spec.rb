require 'rails_helper'

RSpec.describe Profile, type: :model do
 describe "validations" do
   it "is invalid without first_name" do
     profile = Profile.new(first_name: "")
     profile.valid?
     expect(profile.errors).to have_key(:first_name)
   end

   it "is invalid without last_name" do
     profile = Profile.new(last_name: "")
     profile.valid?
     expect(profile.errors).to have_key(:last_name)
   end

 end
end
