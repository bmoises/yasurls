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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101007024704) do

  create_table "urls", :force => true do |t|
    t.string   "destination", :limit => 2048
    t.string   "code",        :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "urls", ["code"], :name => "index_urls_on_code"
  add_index "urls", ["destination"], :name => "index_urls_on_destination", :length => {"destination"=>"767"}

end
