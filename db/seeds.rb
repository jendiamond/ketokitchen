# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chefs = Chef.create([{ chefname: 'Jen Diamond', email: 'thejendiamond@gmail.com',
                        password: 'password', password_confirmation: 'password', admin: true },
                      { chefname: 'Kitten Diamond', email: 'kittendiamond@gmail.com',
                        password: 'password', password_confirmation: 'password' },
                      { chefname: 'Dean Anes', email: 'dean.anes@gmail.com',
                        password: 'password', password_confirmation: 'password' }])

Recipe.create( name: 'Cauliflower crusted grilled cheese sandwiches',
               description: "1 head of cauliflower", chef_id: 2 )

ingredients=['butter', 'chicken', 'hamburger', 'beef']
ingredients.each { |i| Ingredient.create(name: i) }
