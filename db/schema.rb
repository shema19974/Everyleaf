<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_10_01_195425) do

=======
ActiveRecord::Schema.define(version: 2019_10_01_092140) do
>>>>>>> origin/master
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.integer "priority", default: 0
=======
    t.string "status", default: "Not started"
    t.index ["status"], name: "index_tasks_on_status"
    t.index ["title"], name: "index_tasks_on_title"
>>>>>>> origin/master
  end

end
