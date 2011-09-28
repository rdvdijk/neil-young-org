class Link < ActiveRecord::Base
  validates_presence_of :url, :title, :description
  belongs_to :category

  scope :visible, where(:state => "accepted")
  scope :submitted, where(:state => "submitted")

  state_machine :state, :initial => :submitted do
    event :accept do
      transition :submitted => :accepted
    end
    event :deny do
      transition :submitted => :denied
    end
  end

end
