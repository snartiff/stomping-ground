#Run rake db:seed to seed with this data.
#Administrator Login: email: administrator@test.com, password: password
#Member Login: email: green.monster@test.com, password: password
if Rails.env.development?
  User.create(email: "green.monster@test.com", username: "green_monster", password: "password",
  created_at: Date.new(), updated_at: Date.new(), first_name: "Green", last_name: "Monster",
  role: "member", remote_avatar_url: "https://www.firstcitymotorsales.com/images/220x260_wally_puppet.jpg")

  User.create(email: "administrator@test.com", username: "Administrator", password: "password",
  created_at: Date.new(), updated_at: Date.new(), first_name: "Administrator", last_name: "StompingGround",
  role: "admin", remote_avatar_url: "http://cloud4good.com/wp-content/uploads/2014/07/admin.png")

  District.create(name: "Allston", description: "The neighborhood of Allston is
  almost completely cut off from the main body of the city of Boston by the town
  of Brookline, which borders Allston on the south and east. It is connected to
  the rest of Boston only by a small portion of its eastern border that is shared with the Fenway/Kenmore neighborhood.",
  user_id: 1, created_at: Date.new(), updated_at: Date.new(), remote_avatar_url:
  "https://farm1.staticflickr.com/499/19333879574_b22dfdfdce_o.jpg")

  District.create(name: "Dorchester", description: "Dorchester on the left, Milton
  on the right (south) side of the river. Dorchester is a historic neighborhood
  comprising over 6 square miles (16 km2) in Boston, Massachusetts, United States.",
  user_id: 2, created_at: Date.new(), updated_at: Date.new(), remote_avatar_url:
  "http://www.alliedrecyclingcenterinc.com/wp-content/uploads/2014/10/dorchester.jpg")

  Review.create(title: "A fantastic neighborhood!", body: "I love all of the
  delicious Korean restaurants here in Allston. It's definitely one of my
  favorite neighborhoods in Boston.", rating: 5, district_id: 1, user_id: 1,
  created_at: Date.new(), updated_at: Date.new())

  Review.create(title: "It's not my favorite...", body: "Dorchester isn't my
  my favorite neighborhood in Boston. There's not a lot to do as a young professional.",
  rating: 2, district_id: 2, user_id: 2,
  created_at: Date.new(), updated_at: Date.new())
end
