User.destroy_all
Expense.destroy_all
Category.destroy_all

User.create!([
user1 = {
  name: "Anja",
  email: "taktagada@gmail.com",
  password: "123456"
},
user2 = {
  name: "Test",
  email: "test@gmail.com",
  password: "123456"
},
user3 = {
  name: "Test2",
  email: "test2@gmail.com",
  password: "123456"
},])

p "Created #{User.count} Users"
