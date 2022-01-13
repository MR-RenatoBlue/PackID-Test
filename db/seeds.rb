puts "Creating first User as admin"
User.create(email: "admin@packid.com", password: "password" )
User.first.add_role :admin