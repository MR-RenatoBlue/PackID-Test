puts "Creating first User as admin"
User.create(name: "admin@packid.com", password: "password" )
User.first.add_role :admin