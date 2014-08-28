Fabricator(:review) do
  rating { rand(1..5) }
  text { Faker::Lorem.paragraph(2) }
end