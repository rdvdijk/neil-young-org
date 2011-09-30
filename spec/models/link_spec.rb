require "spec_helper"

describe Link do
  it { should validate_presence_of :url }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }

  it { should belong_to :category }
  it { should belong_to :verifier }
  it { should have_many :broken_link_reports }

  context "scopes" do

    it "should only select visible links for the visited scope" do
      new_link = Fabricate(:link)
      visible_link = Fabricate(:link, :state => "accepted")

      Link.visible.to_a.should =~ [ visible_link ]
    end

    it "should only select submitted links for the submitted scope" do
      new_link = Fabricate(:link)
      visible_link = Fabricate(:link, :state => "accepted")

      Link.submitted.to_a.should =~ [ new_link ]
    end

    it "should only select reported links for the reported scope" do
      visible_link1 = Fabricate(:link, :state => "accepted")
      visible_link2 = Fabricate(:link, :state => "accepted")

      visible_link2.broken_link_reports.build
      visible_link2.save!

      Link.reported.to_a.should =~ [ visible_link2 ]
    end

    it "should not select denied reported links for the reported scope" do
      visible_link1 = Fabricate(:link, :state => "accepted")
      visible_link2 = Fabricate(:link, :state => "accepted")

      visible_link2.broken_link_reports.build(:state => "denied")
      visible_link2.save!

      Link.reported.to_a.should =~ []
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

  context "broken links" do

    before do
      @link = Fabricate(:link)
      @link.broken_link_reports.build
      @link.save!
    end
    subject { @link }

    it "should change state when confirmed broken" do
      @link.confirm_broken!
      @link.should be_broken
    end

    it "should not be reported if denied broken" do
      @link.deny_broken!
      Link.reported.should_not include @link
    end

  end
end
