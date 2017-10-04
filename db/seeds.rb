# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

team = Group.where(tip_group: 'Equipo')
User.create(full_name: 'Juan Carlos Perez', email: 'email1@gmail.com'. passwword: '1234', group_id: team.id)
User.create(full_name: 'John Marston', email: 'email2@gmail.com'. passwword: '1234', group_id: team.id)
User.create(full_name: 'Ana Jimenez Aguilar', email: 'email3@gmail.com'. passwword: '1234', group_id: team.id)
User.create(full_name: 'Maria Bautista Rojas', email: 'email4@gmail.com'. passwword: '1234', group_id: team.id)


User.create(full_name: 'Juan Carlos Perez', email: 'email5@gmail.com'. passwword: '1234', group_id: 2)
User.create(full_name: 'John Marston', email: 'email6@gmail.com'. passwword: '1234', group_id: 2)
User.create(full_name: 'Ana Jimenez Aguilar', email: 'email7@gmail.com'. passwword: '1234', group_id: 2)
User.create(full_name: 'Maria Bautista Rojas', email: 'email8@gmail.com'. passwword: '1234', group_id: 2)


User.create(full_name: 'Juan Carlos Perez', email: 'email9@gmail.com'. passwword: '1234', group_id: 3)
User.create(full_name: 'John Marston', email: 'email10@gmail.com'. passwword: '1234', group_id: 3)
User.create(full_name: 'Ana Jimenez Aguilar', email: 'email11@gmail.com'. passwword: '1234', group_id: 3)
User.create(full_name: 'Maria Bautista Rojas', email: 'email12@gmail.com'. passwword: '1234', group_id: 3)