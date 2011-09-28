Fabricator(:link) do
  url         { sequence(:url)          { |i| "http://example.com/page/#{i}" } }
  title       { sequence(:title)        { |i| "Title #{i}" } }
  description { sequence(:description)  { |i| "Description #{i}" } }
end
