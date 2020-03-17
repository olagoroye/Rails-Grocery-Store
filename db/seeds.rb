# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
    {
      username: "Tiara",
      email: "tiara@gmail.com",
      password: "password"
      
    },
    {
        username: "Lolu",
        email: "lolu@gmail.com",
        password: "password"
    }
    
  ])

List.create(title: "Everyday List", user: User.first)


Item.create([
    {
      name: "Cocoa",
      description: "All the Nutrient",
      price: "25.00",
      brand: "Nestle"
      
    },
    {
      name: "Oral B",
      description: "Fresh Mint of Breath",
      price: "10.00",
      brand: "Denture"
      
    },
    {
      name: "Vegan Bread",
      description: "No Artificial Sugar- Low Carbs",
      price: "13.00",
      brand: "Mary Dee"
     
    },
    {
      name: "Bread",
      description: "Sweet- No Bromate",
      price: "5.00",
      brand: "Yummy"
     
    },
    {
      name: "Coffee",
      description: "Life feels good",
      price: "8.00",
      brand: "Heb"
     
    },
    {
      name: "Tylenol",
      description: "All Remedy",
      price: "5.00",
      brand: "complete Health"
     
    }
  ])