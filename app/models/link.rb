class Link < ActiveRecord::Base
  validates_presence_of :url, :title, :description

  belongs_to :category
  belongs_to :verifier, :class_name => "User"
  belongs_to :creator, :class_name => "User"
  has_many :broken_link_reports, :conditions => { :state => "reported" }

  scope :visible, where(:state => "accepted")
  scope :submitted, where(:state => "submitted")

  state_machine :state, :initial => :submitted do
    event :accept do
      transition :submitted => :accepted
    end
    event :deny do
      transition :submitted => :denied
    end
    event :confirm_broken do
      transition any => :broken
    end

    after_transition any => :broken do |link|
      link.broken_link_reports.each.map(&:confirm!)
    end
  end

  def self.reported
    BrokenLinkReport.reported.collect(&:link).uniq
  end

  def deny_broken!
    broken_link_reports.each.map(&:deny!)
  end

end
