# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stations = StationTemplate.create(
    [{name: 'Estação 1', resume: 'Resumo da estação 1', procedure: 'Procedure',
      evaluation: 'Texto', score: 1, minutes: 10, level: 1}]
)
User.create!([
  {name: "Marcelo Júnior", email: "marcelo.junior@escolar.ifrn.edu.br", password: "123321", password_confirmation: "123321", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {name: "Ana Carolina", email: "marcelo.junior@ifrn.edu.br", password: "123321", password_confirmation: "123321", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {name: "Gabriel Mattiuci", email: "naoresponda.marcelo@gmail.com", password: "123321", password_confirmation: "123321", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil}
])