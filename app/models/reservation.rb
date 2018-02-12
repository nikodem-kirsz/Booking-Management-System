class Reservation < ApplicationRecord
  def self.days(wejscie, wyjscie)
    return wyjscie - wejscie
  end
end
