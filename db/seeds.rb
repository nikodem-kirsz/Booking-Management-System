# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mieszkania = ['Czapskich 9/105', 'Pilsudskiego 1/12', 'Zwierzyniecka 9/11', 'Rynek Glowny 1', 'Puszkarska 9/5', 'Kremerowska 1/12', 'Lindego 13D/5',
              'Mazowiecka 41A'
]

mieszkania.each do |mieszkanie|
  Apartament.create(adres: mieszkanie, koszt_najmu: [1200, 1600, 2000, 2500, 3400, 4800].sample, czas_trwania_umowy: [12, 24, 36, 48, 60].sample).save
end

400.times do |n|

  Reservation.create(numer: Faker::Number.number(5).to_str,
                     status: ["Rezerwacja", "Anulowanie"].sample,
                     zrodlo: ["Booking", "Airbnb", "Expedia", "Bezpośrednia"].sample,
                     kwota: Faker::Number.number(3),
                     komentarz: Faker::Lorem.paragraph(2),
                     sprzatanie: Faker::Lorem.paragraph(2),
                     data_zakwaterowania: Faker::Time.between(DateTime.now + 1, DateTime.now),
                     data_wykwaterowania: Faker::Time.between(DateTime.now + 1, DateTime.now),
                     ilosc_osob: Faker::Number.between(1, 10),
                     pracownik: ['Bartek Kirsz', 'Nikodem Kirsz', 'Anna Kirsz'].sample,
                     klient: Faker::Name.name,
                     godzina_przylotu: Faker::Time.between(DateTime.now + 1, DateTime.now),
                     numer_przylotu: Faker::Number.number(3).to_str,
                     komentarz_do_transportu_z_lotniska: Faker::Lorem.paragraph(2),
                     godzina_wylotu: Faker::Time.forward(23, :morning),
                     numer_wylotu: Faker::Number.number(3).to_str,
                     komentarz_do_transportu_na_lotnisko: Faker::Lorem.paragraph(2),
                     komentarz_do_wycieczek: Faker::Lorem.paragraph(2),
                     oferte_wprowadzil: ['Bartek Kirsz', 'Nikodem Kirsz', 'Anna Kirsz'].sample,
                     data_wprowadzenia: Faker::Date.forward(0),
                     apartament_id: Apartament.all.sample.id
  ).save
end