# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{
    firstName: "kenneth",
    lastName: "mwangi",
    username: "kenny",
    email: "mwangiken497@gmail.com",
    password: "test",
    password_confirmation: "test",
    location: "Nairobi",
    age: 18,
    occupation: "coder",
    gender: "male"

},
    {
    firstName: "eddy",
    lastName:"ogutu",
    username:"lawi",
    email:"lawiken497@gmail.com",
    password: "test1",
    password_confirmation: "test1",
    location:"Nairobi",
    age:22,
    occupation:"coder",
    gender:"male"
    },

    {
        firstName: "iraki",
        lastName: "kecin",
        username: "kevo",
        email: "kevinken497@gmail.com",
        password: "test",
        password_confirmation: "test",
        location: "Nairobi",
        age: 25,
        occupation: "coder",
        gender: "male"
    }

])


 