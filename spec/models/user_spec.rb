require 'spec_helper'

describe User do

  it { should validate_presence_of :name }
  it { should have_and_belong_to_many :roles }

  context "roles" do

    before do
      @admin_role = Fabricate :admin_role
      @feeds_user_role = Fabricate :feeds_user_role
    end

    it "should know when it's an admin" do
      subject.roles << @admin_role
      subject.should be_admin
    end

    it "should know when it's a feeds user" do
      subject.roles << @feeds_user_role
      subject.should be_feeds_user
    end

  end

end
