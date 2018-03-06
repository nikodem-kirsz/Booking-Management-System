class Reservation < ApplicationRecord
  searchkick
  def self.days(wejscie, wyjscie)
    return wyjscie - wejscie
  end
end
