require 'spec_helper'

describe Category do
  it { should have_many :links }

  context "category sorting" do

    before do
      Fabricate(:category, :name => "Category 1", :sort_order => 2)
      Fabricate(:category, :name => "Category 2", :sort_order => 1)
    end

    it "should sort categories by sort_order" do
      sort_orders = Category.all.collect(&:sort_order)
      sort_orders.should == sort_orders.sort
    end

  end
end
