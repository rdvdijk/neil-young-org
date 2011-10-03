Fabricator(:user) do
  email { sequence(:email) { |i| "email#{i}@example.com" } }
  password "secret"
  name { sequence(:name) { |i| "user #{i}" } }
end
