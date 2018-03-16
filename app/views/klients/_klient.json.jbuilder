json.extract! klient, :id, :imie, :nazwisko, :numer_telefonu, :email, :nazwa_firmy, :ulica, :miasto, :numer_nip, :kod_kraju, :created_at, :updated_at
json.url klient_url(klient, format: :json)
