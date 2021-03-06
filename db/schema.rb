# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140403023539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogit_comments", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "website"
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogit_comments", ["post_id"], name: "index_blogit_comments_on_post_id", using: :btree

  create_table "blogit_posts", force: true do |t|
    t.string   "title",                      null: false
    t.text     "body",                       null: false
    t.integer  "blogger_id"
    t.string   "blogger_type"
    t.integer  "comments_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "post_type"
  end

  add_index "blogit_posts", ["blogger_type", "blogger_id"], name: "index_blogit_posts_on_blogger_type_and_blogger_id", using: :btree

  create_table "business_messengers", force: true do |t|
    t.integer  "super_admin_id"
    t.text     "body"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "citizens", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
    t.string   "title_tagline"
    t.text     "tagline"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "flickr"
    t.string   "pinterest"
    t.string   "tumblr"
    t.string   "dropbox"
    t.string   "google_plus"
    t.string   "instagram"
    t.string   "github"
    t.string   "bitbucket"
    t.string   "vk"
  end

  add_index "citizens", ["email"], name: "index_citizens_on_email", unique: true, using: :btree
  add_index "citizens", ["reset_password_token"], name: "index_citizens_on_reset_password_token", unique: true, using: :btree

  create_table "company_docs", force: true do |t|
    t.string   "company_document_file_name"
    t.string   "company_document_content_type"
    t.integer  "company_document_file_size"
    t.datetime "company_document_updated_at"
    t.integer  "uploader_id"
    t.string   "uploader_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_forum_topics", force: true do |t|
    t.integer  "company_forum_id"
    t.string   "topic_title"
    t.string   "user_type"
    t.integer  "topic_creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_forums", force: true do |t|
    t.integer  "super_admin_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_profiles", force: true do |t|
    t.integer  "super_admin_id"
    t.string   "company_name"
    t.string   "website"
    t.string   "hq_street_address"
    t.string   "hq_city"
    t.string   "hq_state"
    t.string   "hq_zipcode"
    t.string   "hq_country"
    t.datetime "company_establishment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "forum_posts", force: true do |t|
    t.integer  "company_forum_topic_id"
    t.integer  "postable_id"
    t.string   "postable_type"
    t.text     "post_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.integer  "super_admin_id"
    t.string   "name"
    t.string   "location"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.string   "gmaps"
  end

  create_table "managers", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "location_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], name: "index_notifications_on_conversation_id", using: :btree

  create_table "online_stores", force: true do |t|
    t.integer  "super_admin_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "super_admin_id"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "online_store_id"
  end

  create_table "receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "receipts", ["notification_id"], name: "index_receipts_on_notification_id", using: :btree

  create_table "super_admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "phone_number"
    t.string   "user_type"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "location"
    t.string   "uid"
    t.string   "provider"
    t.string   "username"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "subdomain"
    t.string   "title_tagline"
    t.text     "tagline"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "flickr"
    t.string   "pinterest"
    t.string   "tumblr"
    t.string   "dropbox"
    t.string   "google_plus"
    t.string   "instagram"
    t.string   "github"
    t.string   "bitbucket"
    t.string   "vk"
    t.string   "business_type"
    t.string   "business_name"
    t.text     "about"
    t.string   "website"
  end

  add_index "super_admins", ["email"], name: "index_super_admins_on_email", unique: true, using: :btree
  add_index "super_admins", ["reset_password_token"], name: "index_super_admins_on_reset_password_token", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "subdomain"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["owner_id"], name: "index_users_on_owner_id", using: :btree

  add_foreign_key "notifications", "conversations", name: "notifications_on_conversation_id"

  add_foreign_key "receipts", "notifications", name: "receipts_on_notification_id"

end
