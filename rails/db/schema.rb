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

ActiveRecord::Schema.define(version: 20171028091841) do

  create_table "containers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "delivery_date"
    t.string   "purchase_date"
    t.string   "photo"
    t.integer  "duration"
    t.integer  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_containers_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "container_id"
    t.string   "sender"
    t.string   "shop"
    t.integer  "mount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["container_id"], name: "index_payments_on_container_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.integer  "balance"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
