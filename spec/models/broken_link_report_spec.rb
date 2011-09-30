require 'spec_helper'

describe BrokenLinkReport do

  it { should belong_to :link }

  context "state" do

    it { should be_reported }

    it "should transition to confirmed state" do
      subject.confirm!
      subject.should be_confirmed
    end

    it "should transition to denied state" do
      subject.deny!
      subject.should be_denied
    end

  end

end
