# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(full_name: 'Lizbeth Sanchez Perez', email: 'email1@gmail.com', password: '1234', is_admin: true, is_accepted: true )

Group.create(name: 'Equipo',  tip_group:'Equipo', schedule: '' )
Group.create(name: 'Grupo 1', tip_group: 'Regular', schedule: 'Lunes 7:am 9:20am' )
Group.create(name: 'Grupo 2', tip_group: 'Regular', schedule: 'Martes 7:am 9:20am' )

team = Group.where(tip_group: 'Equipo').first

User.create(full_name: 'Juan Carlos Perez', email: 'email1@gmail.com', password: '1234', group_id: team.id)
User.create(full_name: 'John Marston', email: 'email2@gmail.com', password: '1234', group_id: team.id)
User.create(full_name: 'Ana Jimenez Aguilar', email: 'email3@gmail.com', password: '1234', group_id: team.id)
User.create(full_name: 'Maria Bautista Rojas', email: 'email4@gmail.com', password: '1234', group_id: team.id)


User.create(full_name: 'Antonia Atalanta Angelica', email: 'email5@gmail.com', password: '1234', group_id: 2)
User.create(full_name: 'Carmina Leonor Patroklos', email: 'email6@gmail.com', password: '1234', group_id: 2)
User.create(full_name: 'Ilithyia Rhea Dulce', email: 'email7@gmail.com', password: '1234', group_id: 2)
User.create(full_name: 'Tadeo Andromeda Prudencio', email: 'email8@gmail.com' , password: '1234', group_id: 2)


User.create(full_name: 'Juanita Fabián Narcissus', email: 'email9@gmail.com', password: '1234', group_id: 3)
User.create(full_name: 'Luis Cristóbal Nieve', email: 'email10@gmail.com', password: '1234', group_id: 3)
User.create(full_name: 'Azucena Marisol Carme', email: 'email11@gmail.com', password: '1234', group_id: 3)
User.create(full_name: 'Susanita Faunus Roldán', email: 'email12@gmail.com', password: '1234', group_id: 3)