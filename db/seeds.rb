matteo = User.create(username: "Matteo", age: 30, email: "matteo.piccini2@flatironschool.com", password: "password", role: 2)
mike = User.create(username: "Mike", age: 23, email: "mike@flatironschool.com", password: "password", role: 1)

Plant.create(name: "Bamboo", species: "Phyllostachys Aurea", sun_exposure: 3, watering_freq: 5, user: matteo)
Plant.create(name: "Cactus", species: "Cactaceae", sun_exposure: 3, watering_freq: 5, user: mike)
Plant.create(name: "Orchid", species: "Cattleya", sun_exposure: 2, watering_freq: 1, user: matteo)