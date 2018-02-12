json.extract! reservation, :id, :numer, :status, :zrodlo, :kwota, :komentarz, :sprzatanie, :data_zakwaterowania, :godzina_zakwaterowania, :data_wykwaterowania, :godzina_wykwaterowania, :apartament, :ilosc_osob, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
