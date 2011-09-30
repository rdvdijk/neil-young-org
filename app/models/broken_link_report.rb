class BrokenLinkReport < ActiveRecord::Base

  belongs_to :link

  scope :reported, where(:state => "reported")

  state_machine :state, :initial => :reported do
    event :confirm do
      transition :reported => :confirmed
    end
    event :deny do
      transition :reported => :denied
    end
  end

end
