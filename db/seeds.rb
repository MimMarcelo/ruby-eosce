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
