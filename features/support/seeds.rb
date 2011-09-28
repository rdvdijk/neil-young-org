# Contains seeds that need to be present for every test.
Before do
  Fabricate(:category, :name => "Music",      :sort_order => 1)
  Fabricate(:category, :name => "Tour",       :sort_order => 2)
  Fabricate(:category, :name => "Video",      :sort_order => 3)
  Fabricate(:category, :name => "Pictures",   :sort_order => 4)
  Fabricate(:category, :name => "Downloads",  :sort_order => 5)
  Fabricate(:category, :name => "Other",      :sort_order => 6)
end

