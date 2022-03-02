matteo = User.create(username: "Matteo", age: 30, email: "matteo.piccini2@flatironschool.com", password: "password")
mike = User.create(username: "Mike", age: 23, email: "mike@flatironschool.com", password: "password")

Plant.create(name: "Bamboo", species: "Phyllostachys Aurea", sun_exposure: 3, watering_freq: 5, user: matteo)
Plant.create(name: "Cactus", species: "Cactaceae", sun_exposure: 3, watering_freq: 5, user: mike)
