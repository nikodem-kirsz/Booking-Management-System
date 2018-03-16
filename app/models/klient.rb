class Klient < ApplicationRecord
  has_many :reservations

  def self.full_names
    full_names = []
    imiona = self.pluck(:imie)
    nazwiska = self.pluck(:nazwisko)
    imiona.each_with_index do |imie, index|
      full_names[index] = "#{imie} #{nazwiska[index]}"
    end

    return full_names
  end
end
