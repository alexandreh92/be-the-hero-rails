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

ActiveRecord::Schema.define(version: 2020_03_24_200919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accredited_network_categories", force: :cascade do |t|
    t.bigint "accredited_network_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accredited_network_id"], name: "index_accredited_network_categories_on_accredited_network_id"
    t.index ["category_id"], name: "index_accredited_network_categories_on_category_id"
  end

  create_table "accredited_networks", force: :cascade do |t|
    t.string "about"
    t.string "address"
    t.string "address_complement"
    t.string "address_neighbourhood"
    t.string "address_number"
    t.string "city"
    t.string "state"
    t.string "cnpj"
    t.integer "place_type"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.string "phone"
    t.string "website"
    t.string "zipcode"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount", precision: 8, scale: 2
    t.string "rules"
    t.index ["user_id"], name: "index_accredited_networks_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "benefit_categories", force: :cascade do |t|
    t.bigint "benefit_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_benefit_categories_on_benefit_id"
    t.index ["category_id"], name: "index_benefit_categories_on_category_id"
  end

  create_table "benefits", force: :cascade do |t|
    t.string "product_name"
    t.decimal "discount", precision: 8, scale: 2
    t.integer "status", default: 1
    t.bigint "accredited_network_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["accredited_network_id"], name: "index_benefits_on_accredited_network_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "about"
    t.string "address"
    t.string "address_complement"
    t.string "address_neighbourhood"
    t.string "address_number"
    t.string "city"
    t.string "state"
    t.string "cnpj"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.string "phone"
    t.string "website"
    t.string "zipcode"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "company_signatures", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_signatures_on_company_id"
    t.index ["plan_id"], name: "index_company_signatures_on_plan_id"
  end

  create_table "customer_signatures", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_signatures_on_customer_id"
    t.index ["plan_id"], name: "index_customer_signatures_on_plan_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "address"
    t.string "address_complement"
    t.string "address_neighbourhood"
    t.string "address_number"
    t.string "city"
    t.string "state"
    t.string "cpf"
    t.string "first_name"
    t.string "last_name"
    t.integer "gender"
    t.string "phone"
    t.string "zipcode"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sub_group_categories", force: :cascade do |t|
    t.bigint "sub_group_id"
    t.bigint "category_id"
    t.datetime "company_category_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_group_categories_on_category_id"
    t.index ["sub_group_id"], name: "index_sub_group_categories_on_sub_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "approved", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "accredited_network_categories", "accredited_networks"
  add_foreign_key "accredited_network_categories", "categories"
  add_foreign_key "accredited_networks", "users"
  add_foreign_key "admins", "users"
  add_foreign_key "benefit_categories", "benefits"
  add_foreign_key "benefit_categories", "categories"
  add_foreign_key "benefits", "accredited_networks"
  add_foreign_key "companies", "users"
  add_foreign_key "company_signatures", "companies"
  add_foreign_key "company_signatures", "plans"
  add_foreign_key "customer_signatures", "customers"
  add_foreign_key "customer_signatures", "plans"
  add_foreign_key "customers", "users"
end
