require "spec_helper"

describe Link do
  it { should validate_presence_of :url }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }

  it { should belong_to :category }
  it { should belong_to :verifier }

  context "scopes" do

    it "the visible scope should only select visible links" do
      new_link = Fabricate(:link)
      visible_link = Fabricate(:link, :state => "accepted")

      Link.visible.to_a.should =~ [ visible_link ]
    end

    it "the submitted scope should only select submitted links" do
      new_link = Fabricate(:link)
      visible_link = Fabricate(:link, :state => "accepted")

      Link.submitted.to_a.should =~ [ new_link ]
    end

  end

  context "states" do

    before { @link = Fabricate(:link) }
    subject { @link }

    it "should be in submitted state by default" do
      subject.should be_submitted
    end

    it "should transition to accepted state" do
      subject.accept!
      subject.should be_accepted
    end

    it "should transition to denied state" do
      subject.deny!
      subject.should be_denied
    end

  end
end
