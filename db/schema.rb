# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180212220308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.string "numer"
    t.string "status"
    t.string "zrodlo"
    t.integer "kwota"
    t.text "komentarz"
    t.text "sprzatanie"
    t.date "data_zakwaterowania"
    t.time "godzina_zakwaterowania"
    t.date "data_wykwaterowania"
    t.time "godzina_wykwaterowania"
    t.string "apartament"
    t.integer "ilosc_osob"
    t.string "pracownik"
    t.string "klient"
    t.time "godzina_przylotu"
    t.string "numer_przylotu"
    t.text "komentarz_do_transportu_z_lotniska"
    t.time "godzina_wylotu"
    t.string "numer_wylotu"
    t.text "komentarz_do_transportu_na_lotnisko"
    t.text "komentarz_do_wycieczek"
    t.string "oferte_wprowadzil"
    t.date "data_wprowadzenia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imie"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
