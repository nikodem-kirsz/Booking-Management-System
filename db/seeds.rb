# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

40.times do |n|
  Reservation.create(numer: Faker::Number.number(5),
                     status: 'aktualne',
                     zrodlo: ['booking.com', 'airbnb.com', 'manual'].sample,
                     kwota: Faker::Number.number(3),
                     komentarz: Faker::Lorem.paragraph(2),
                     sprzatanie: Faker::Lorem.paragraph(2),
                     data_zakwaterowania: Faker::Date.forward(0),
                     godzina_zakwaterowania: Faker::Time.between(DateTime.now + 1, DateTime.now),
                     data_wykwaterowania: Faker::Date.forward(10),
                     godzina_wykwaterowania: Faker::Time.forward(23, :morning),
                     apartament: ['Czapskich', 'Lindego', 'Mazowiecka', 'Poznanska'].sample,
                     ilosc_osob: Faker::Number.between(1, 10),
                     pracownik: ['Bartek Kirsz', 'Nikodem Kirsz', 'Anna Kirsz'].sample,
                     klient: Faker::Name.name,
                     godzina_przylotu: Faker::Time.between(DateTime.now + 1, DateTime.now),
                     numer_przylotu: Faker::Number.number(3),
                     komentarz_do_transportu_z_lotniska: Faker::Lorem.paragraph(2),
                     godzina_wylotu: Faker::Time.forward(23, :morning),
                     numer_wylotu: Faker::Number.number(3),
                     komentarz_do_transportu_na_lotnisko: Faker::Lorem.paragraph(2),
                     komentarz_do_wycieczek: Faker::Lorem.paragraph(2),
                     oferte_wprowadzil: ['Bartek Kirsz', 'Nikodem Kirsz', 'Anna Kirsz'].sample,
                     data_wprowadzenia: Faker::Date.forward(0),
  ).save
end