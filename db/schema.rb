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

ActiveRecord::Schema.define(version: 0) do

  create_table "actor", primary_key: "actor_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "actor_user", unsigned: true
    t.string "actor_name", null: false, collation: "utf8_bin"
    t.index ["actor_name"], name: "actor_name", unique: true
    t.index ["actor_user"], name: "actor_user", unique: true
  end

  create_table "archive", primary_key: "ar_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ar_namespace", default: 0, null: false
    t.string "ar_title", default: "", null: false, collation: "utf8_bin"
    t.binary "ar_comment", limit: 767, default: "", null: false
    t.bigint "ar_comment_id", default: 0, null: false, unsigned: true
    t.integer "ar_user", default: 0, null: false, unsigned: true
    t.string "ar_user_text", default: "", null: false, collation: "utf8_bin"
    t.bigint "ar_actor", default: 0, null: false, unsigned: true
    t.binary "ar_timestamp", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.integer "ar_minor_edit", limit: 1, default: 0, null: false
    t.integer "ar_rev_id", null: false, unsigned: true
    t.integer "ar_text_id", default: 0, null: false, unsigned: true
    t.integer "ar_deleted", limit: 1, default: 0, null: false, unsigned: true
    t.integer "ar_len", unsigned: true
    t.integer "ar_page_id", unsigned: true
    t.integer "ar_parent_id", unsigned: true
    t.binary "ar_sha1", limit: 32, default: "", null: false
    t.binary "ar_content_model", limit: 32
    t.binary "ar_content_format", limit: 64
    t.index ["ar_actor", "ar_timestamp"], name: "ar_actor_timestamp"
    t.index ["ar_namespace", "ar_title", "ar_timestamp"], name: "name_title_timestamp"
    t.index ["ar_rev_id"], name: "ar_revid"
    t.index ["ar_user_text", "ar_timestamp"], name: "ar_usertext_timestamp"
  end

  create_table "bot_passwords", primary_key: ["bp_user", "bp_app_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "bp_user", null: false, unsigned: true
    t.binary "bp_app_id", limit: 32, null: false
    t.blob "bp_password", limit: 255, null: false
    t.binary "bp_token", limit: 32, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.binary "bp_restrictions", null: false
    t.binary "bp_grants", null: false
  end

  create_table "category", primary_key: "cat_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "cat_title", null: false, collation: "utf8_bin"
    t.integer "cat_pages", default: 0, null: false
    t.integer "cat_subcats", default: 0, null: false
    t.integer "cat_files", default: 0, null: false
    t.index ["cat_pages"], name: "cat_pages"
    t.index ["cat_title"], name: "cat_title", unique: true
  end

  create_table "categorylinks", primary_key: ["cl_from", "cl_to"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cl_from", default: 0, null: false, unsigned: true
    t.string "cl_to", default: "", null: false, collation: "utf8_bin"
    t.binary "cl_sortkey", limit: 230, default: "", null: false
    t.string "cl_sortkey_prefix", default: "", null: false, collation: "utf8_bin"
    t.timestamp "cl_timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.binary "cl_collation", limit: 32, default: "", null: false
    t.string "cl_type", limit: 6, default: "page", null: false
    t.index ["cl_collation", "cl_to", "cl_type", "cl_from"], name: "cl_collation_ext"
    t.index ["cl_to", "cl_timestamp"], name: "cl_timestamp"
    t.index ["cl_to", "cl_type", "cl_sortkey", "cl_from"], name: "cl_sortkey"
  end

  create_table "change_tag", primary_key: "ct_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ct_rc_id"
    t.integer "ct_log_id", unsigned: true
    t.integer "ct_rev_id", unsigned: true
    t.string "ct_tag", null: false
    t.binary "ct_params"
    t.index ["ct_log_id", "ct_tag"], name: "change_tag_log_tag", unique: true
    t.index ["ct_rc_id", "ct_tag"], name: "change_tag_rc_tag", unique: true
    t.index ["ct_rev_id", "ct_tag"], name: "change_tag_rev_tag", unique: true
    t.index ["ct_tag", "ct_rc_id", "ct_rev_id", "ct_log_id"], name: "change_tag_tag_id"
  end

  create_table "comment", primary_key: "comment_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "comment_hash", null: false
    t.binary "comment_text", null: false
    t.binary "comment_data"
    t.index ["comment_hash"], name: "comment_hash"
  end

  create_table "content", primary_key: "content_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "content_size", null: false, unsigned: true
    t.binary "content_sha1", limit: 32, null: false
    t.integer "content_model", limit: 2, null: false, unsigned: true
    t.binary "content_address", limit: 255, null: false
  end

  create_table "content_models", primary_key: "model_id", id: :integer, limit: 2, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "model_name", limit: 64, null: false
    t.index ["model_name"], name: "model_name", unique: true
  end

  create_table "externallinks", primary_key: "el_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "el_from", default: 0, null: false, unsigned: true
    t.binary "el_to", null: false
    t.binary "el_index", null: false
    t.binary "el_index_60", limit: 60, default: "", null: false
    t.index ["el_from", "el_index_60", "el_id"], name: "el_from_index_60"
    t.index ["el_from", "el_to"], name: "el_from", length: { el_to: 40 }
    t.index ["el_index"], name: "el_index", length: { el_index: 60 }
    t.index ["el_index_60", "el_id"], name: "el_index_60"
    t.index ["el_to", "el_from"], name: "el_to", length: { el_to: 60 }
  end

  create_table "filearchive", primary_key: "fa_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "fa_name", default: "", null: false, collation: "utf8_bin"
    t.string "fa_archive_name", default: "", collation: "utf8_bin"
    t.binary "fa_storage_group", limit: 16
    t.binary "fa_storage_key", limit: 64, default: ""
    t.integer "fa_deleted_user"
    t.binary "fa_deleted_timestamp", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000"
    t.binary "fa_deleted_reason", limit: 767, default: ""
    t.bigint "fa_deleted_reason_id", default: 0, null: false, unsigned: true
    t.integer "fa_size", default: 0, unsigned: true
    t.integer "fa_width", default: 0
    t.integer "fa_height", default: 0
    t.binary "fa_metadata", limit: 16777215
    t.integer "fa_bits", default: 0
    t.string "fa_media_type", limit: 10
    t.string "fa_major_mime", limit: 11, default: "unknown"
    t.binary "fa_minor_mime", limit: 100, default: "unknown"
    t.binary "fa_description", limit: 767, default: ""
    t.bigint "fa_description_id", default: 0, null: false, unsigned: true
    t.integer "fa_user", default: 0, unsigned: true
    t.string "fa_user_text", default: "", collation: "utf8_bin"
    t.bigint "fa_actor", default: 0, null: false, unsigned: true
    t.binary "fa_timestamp", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000"
    t.integer "fa_deleted", limit: 1, default: 0, null: false, unsigned: true
    t.binary "fa_sha1", limit: 32, default: "", null: false
    t.index ["fa_actor", "fa_timestamp"], name: "fa_actor_timestamp"
    t.index ["fa_deleted_timestamp"], name: "fa_deleted_timestamp"
    t.index ["fa_name", "fa_timestamp"], name: "fa_name"
    t.index ["fa_sha1"], name: "fa_sha1", length: { fa_sha1: 10 }
    t.index ["fa_storage_group", "fa_storage_key"], name: "fa_storage_group"
    t.index ["fa_user_text", "fa_timestamp"], name: "fa_user_timestamp"
  end

  create_table "image", primary_key: "img_name", id: :string, default: "", collation: "utf8_bin", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "img_size", default: 0, null: false, unsigned: true
    t.integer "img_width", default: 0, null: false
    t.integer "img_height", default: 0, null: false
    t.binary "img_metadata", limit: 16777215, null: false
    t.integer "img_bits", default: 0, null: false
    t.string "img_media_type", limit: 10
    t.string "img_major_mime", limit: 11, default: "unknown", null: false
    t.binary "img_minor_mime", limit: 100, default: "unknown", null: false
    t.binary "img_description", limit: 767, default: "", null: false
    t.bigint "img_description_id", default: 0, null: false, unsigned: true
    t.integer "img_user", default: 0, null: false, unsigned: true
    t.string "img_user_text", default: "", null: false, collation: "utf8_bin"
    t.bigint "img_actor", default: 0, null: false, unsigned: true
    t.binary "img_timestamp", limit: 14, default: "", null: false
    t.binary "img_sha1", limit: 32, default: "", null: false
    t.index ["img_actor", "img_timestamp"], name: "img_actor_timestamp"
    t.index ["img_media_type", "img_major_mime", "img_minor_mime"], name: "img_media_mime"
    t.index ["img_sha1"], name: "img_sha1", length: { img_sha1: 10 }
    t.index ["img_size"], name: "img_size"
    t.index ["img_timestamp"], name: "img_timestamp"
    t.index ["img_user", "img_timestamp"], name: "img_user_timestamp"
    t.index ["img_user_text", "img_timestamp"], name: "img_usertext_timestamp"
  end

  create_table "image_comment_temp", primary_key: ["imgcomment_name", "imgcomment_description_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "imgcomment_name", null: false, collation: "utf8_bin"
    t.bigint "imgcomment_description_id", null: false, unsigned: true
    t.index ["imgcomment_name"], name: "imgcomment_name", unique: true
  end

  create_table "imagelinks", primary_key: ["il_from", "il_to"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "il_from", default: 0, null: false, unsigned: true
    t.integer "il_from_namespace", default: 0, null: false
    t.string "il_to", default: "", null: false, collation: "utf8_bin"
    t.index ["il_from_namespace", "il_to", "il_from"], name: "il_backlinks_namespace"
    t.index ["il_to", "il_from"], name: "il_to"
  end

  create_table "interwiki", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "iw_prefix", limit: 32, null: false
    t.binary "iw_url", null: false
    t.binary "iw_api", null: false
    t.string "iw_wikiid", limit: 64, null: false
    t.boolean "iw_local", null: false
    t.integer "iw_trans", limit: 1, default: 0, null: false
    t.index ["iw_prefix"], name: "iw_prefix", unique: true
  end

  create_table "ip_changes", primary_key: "ipc_rev_id", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "ipc_rev_timestamp", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.binary "ipc_hex", limit: 35, default: "", null: false
    t.index ["ipc_hex", "ipc_rev_timestamp"], name: "ipc_hex_time"
    t.index ["ipc_rev_timestamp"], name: "ipc_rev_timestamp"
  end

  create_table "ipblocks", primary_key: "ipb_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.blob "ipb_address", limit: 255, null: false
    t.integer "ipb_user", default: 0, null: false, unsigned: true
    t.integer "ipb_by", default: 0, null: false, unsigned: true
    t.string "ipb_by_text", default: "", null: false, collation: "utf8_bin"
    t.bigint "ipb_by_actor", default: 0, null: false, unsigned: true
    t.binary "ipb_reason", limit: 767, default: "", null: false
    t.bigint "ipb_reason_id", default: 0, null: false, unsigned: true
    t.binary "ipb_timestamp", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.boolean "ipb_auto", default: false, null: false
    t.boolean "ipb_anon_only", default: false, null: false
    t.boolean "ipb_create_account", default: true, null: false
    t.boolean "ipb_enable_autoblock", default: true, null: false
    t.binary "ipb_expiry", limit: 14, default: "", null: false
    t.blob "ipb_range_start", limit: 255, null: false
    t.blob "ipb_range_end", limit: 255, null: false
    t.boolean "ipb_deleted", default: false, null: false
    t.boolean "ipb_block_email", default: false, null: false
    t.boolean "ipb_allow_usertalk", default: false, null: false
    t.integer "ipb_parent_block_id"
    t.index ["ipb_address", "ipb_user", "ipb_auto", "ipb_anon_only"], name: "ipb_address", unique: true, length: { ipb_address: 255 }
    t.index ["ipb_expiry"], name: "ipb_expiry"
    t.index ["ipb_parent_block_id"], name: "ipb_parent_block_id"
    t.index ["ipb_range_start", "ipb_range_end"], name: "ipb_range", length: { ipb_range_start: 8, ipb_range_end: 8 }
    t.index ["ipb_timestamp"], name: "ipb_timestamp"
    t.index ["ipb_user"], name: "ipb_user"
  end

  create_table "iwlinks", primary_key: ["iwl_from", "iwl_prefix", "iwl_title"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "iwl_from", default: 0, null: false, unsigned: true
    t.binary "iwl_prefix", limit: 20, default: "", null: false
    t.string "iwl_title", default: "", null: false, collation: "utf8_bin"
    t.index ["iwl_prefix", "iwl_from", "iwl_title"], name: "iwl_prefix_from_title"
    t.index ["iwl_prefix", "iwl_title", "iwl_from"], name: "iwl_prefix_title_from"
  end

  create_table "job", primary_key: "job_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "job_cmd", limit: 60, default: "", null: false
    t.integer "job_namespace", null: false
    t.string "job_title", null: false, collation: "utf8_bin"
    t.binary "job_timestamp", limit: 14
    t.binary "job_params", null: false
    t.integer "job_random", default: 0, null: false, unsigned: true
    t.integer "job_attempts", default: 0, null: false, unsigned: true
    t.binary "job_token", limit: 32, default: "", null: false
    t.binary "job_token_timestamp", limit: 14
    t.binary "job_sha1", limit: 32, default: "", null: false
    t.index ["job_cmd", "job_namespace", "job_title", "job_params"], name: "job_cmd", length: { job_params: 128 }
    t.index ["job_cmd", "job_token", "job_id"], name: "job_cmd_token_id"
    t.index ["job_cmd", "job_token", "job_random"], name: "job_cmd_token"
    t.index ["job_sha1"], name: "job_sha1"
    t.index ["job_timestamp"], name: "job_timestamp"
  end

  create_table "l10n_cache", primary_key: ["lc_lang", "lc_key"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "lc_lang", limit: 32, null: false
    t.string "lc_key", null: false
    t.binary "lc_value", limit: 16777215, null: false
  end

  create_table "langlinks", primary_key: ["ll_from", "ll_lang"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ll_from", default: 0, null: false, unsigned: true
    t.binary "ll_lang", limit: 20, default: "", null: false
    t.string "ll_title", default: "", null: false, collation: "utf8_bin"
    t.index ["ll_lang", "ll_title"], name: "ll_lang"
  end

  create_table "log_search", primary_key: ["ls_field", "ls_value", "ls_log_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "ls_field", limit: 32, null: false
    t.string "ls_value", null: false
    t.integer "ls_log_id", default: 0, null: false, unsigned: true
    t.index ["ls_log_id"], name: "ls_log_id"
  end

  create_table "logging", primary_key: "log_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "log_type", limit: 32, default: "", null: false
    t.binary "log_action", limit: 32, default: "", null: false
    t.binary "log_timestamp", limit: 14, default: "19700101000000", null: false
    t.integer "log_user", default: 0, null: false, unsigned: true
    t.string "log_user_text", default: "", null: false, collation: "utf8_bin"
    t.bigint "log_actor", default: 0, null: false, unsigned: true
    t.integer "log_namespace", default: 0, null: false
    t.string "log_title", default: "", null: false, collation: "utf8_bin"
    t.integer "log_page", unsigned: true
    t.binary "log_comment", limit: 767, default: "", null: false
    t.bigint "log_comment_id", default: 0, null: false, unsigned: true
    t.binary "log_params", null: false
    t.integer "log_deleted", limit: 1, default: 0, null: false, unsigned: true
    t.index ["log_actor", "log_timestamp"], name: "actor_time"
    t.index ["log_actor", "log_type", "log_timestamp"], name: "log_actor_type_time"
    t.index ["log_namespace", "log_title", "log_timestamp"], name: "page_time"
    t.index ["log_page", "log_timestamp"], name: "log_page_id_time"
    t.index ["log_timestamp"], name: "times"
    t.index ["log_type", "log_action", "log_timestamp"], name: "type_action"
    t.index ["log_type", "log_timestamp"], name: "type_time"
    t.index ["log_user", "log_timestamp"], name: "user_time"
    t.index ["log_user", "log_type", "log_timestamp"], name: "log_user_type_time"
    t.index ["log_user_text", "log_timestamp"], name: "log_user_text_time"
    t.index ["log_user_text", "log_type", "log_timestamp"], name: "log_user_text_type_time"
  end

  create_table "module_deps", primary_key: ["md_module", "md_skin"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "md_module", limit: 255, null: false
    t.binary "md_skin", limit: 32, null: false
    t.binary "md_deps", limit: 16777215, null: false
  end

  create_table "objectcache", primary_key: "keyname", id: :binary, limit: 255, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "value", limit: 16777215
    t.datetime "exptime"
    t.index ["exptime"], name: "exptime"
  end

  create_table "oldimage", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "oi_name", default: "", null: false, collation: "utf8_bin"
    t.string "oi_archive_name", default: "", null: false, collation: "utf8_bin"
    t.integer "oi_size", default: 0, null: false, unsigned: true
    t.integer "oi_width", default: 0, null: false
    t.integer "oi_height", default: 0, null: false
    t.integer "oi_bits", default: 0, null: false
    t.binary "oi_description", limit: 767, default: "", null: false
    t.bigint "oi_description_id", default: 0, null: false, unsigned: true
    t.integer "oi_user", default: 0, null: false, unsigned: true
    t.string "oi_user_text", default: "", null: false, collation: "utf8_bin"
    t.bigint "oi_actor", default: 0, null: false, unsigned: true
    t.binary "oi_timestamp", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.binary "oi_metadata", limit: 16777215, null: false
    t.string "oi_media_type", limit: 10
    t.string "oi_major_mime", limit: 11, default: "unknown", null: false
    t.binary "oi_minor_mime", limit: 100, default: "unknown", null: false
    t.integer "oi_deleted", limit: 1, default: 0, null: false, unsigned: true
    t.binary "oi_sha1", limit: 32, default: "", null: false
    t.index ["oi_actor", "oi_timestamp"], name: "oi_actor_timestamp"
    t.index ["oi_name", "oi_archive_name"], name: "oi_name_archive_name", length: { oi_archive_name: 14 }
    t.index ["oi_name", "oi_timestamp"], name: "oi_name_timestamp"
    t.index ["oi_sha1"], name: "oi_sha1", length: { oi_sha1: 10 }
    t.index ["oi_user_text", "oi_timestamp"], name: "oi_usertext_timestamp"
  end

  create_table "page", primary_key: "page_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "page_namespace", null: false
    t.string "page_title", null: false, collation: "utf8_bin"
    t.blob "page_restrictions", limit: 255, null: false
    t.integer "page_is_redirect", limit: 1, default: 0, null: false, unsigned: true
    t.integer "page_is_new", limit: 1, default: 0, null: false, unsigned: true
    t.float "page_random", limit: 53, null: false, unsigned: true
    t.binary "page_touched", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.binary "page_links_updated", limit: 14
    t.integer "page_latest", null: false, unsigned: true
    t.integer "page_len", null: false, unsigned: true
    t.binary "page_content_model", limit: 32
    t.binary "page_lang", limit: 35
    t.index ["page_is_redirect", "page_namespace", "page_len"], name: "page_redirect_namespace_len"
    t.index ["page_len"], name: "page_len"
    t.index ["page_namespace", "page_title"], name: "name_title", unique: true
    t.index ["page_random"], name: "page_random"
  end

  create_table "page_props", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "pp_page", null: false
    t.binary "pp_propname", limit: 60, null: false
    t.binary "pp_value", null: false
    t.float "pp_sortkey", limit: 24
    t.index ["pp_page", "pp_propname"], name: "pp_page_propname", unique: true
    t.index ["pp_propname", "pp_page"], name: "pp_propname_page", unique: true
    t.index ["pp_propname", "pp_sortkey", "pp_page"], name: "pp_propname_sortkey_page", unique: true
  end

  create_table "page_restrictions", primary_key: "pr_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "pr_page", null: false
    t.binary "pr_type", limit: 60, null: false
    t.binary "pr_level", limit: 60, null: false
    t.integer "pr_cascade", limit: 1, null: false
    t.integer "pr_user", unsigned: true
    t.binary "pr_expiry", limit: 14
    t.index ["pr_cascade"], name: "pr_cascade"
    t.index ["pr_level"], name: "pr_level"
    t.index ["pr_page", "pr_type"], name: "pr_pagetype", unique: true
    t.index ["pr_type", "pr_level"], name: "pr_typelevel"
  end

  create_table "pagelinks", primary_key: ["pl_from", "pl_namespace", "pl_title"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "pl_from", default: 0, null: false, unsigned: true
    t.integer "pl_from_namespace", default: 0, null: false
    t.integer "pl_namespace", default: 0, null: false
    t.string "pl_title", default: "", null: false, collation: "utf8_bin"
    t.index ["pl_from_namespace", "pl_namespace", "pl_title", "pl_from"], name: "pl_backlinks_namespace"
    t.index ["pl_namespace", "pl_title", "pl_from"], name: "pl_namespace"
  end

  create_table "protected_titles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "pt_namespace", null: false
    t.string "pt_title", null: false, collation: "utf8_bin"
    t.integer "pt_user", null: false, unsigned: true
    t.binary "pt_reason", limit: 767, default: ""
    t.bigint "pt_reason_id", default: 0, null: false, unsigned: true
    t.binary "pt_timestamp", limit: 14, null: false
    t.binary "pt_expiry", limit: 14, default: "", null: false
    t.binary "pt_create_perm", limit: 60, null: false
    t.index ["pt_namespace", "pt_title"], name: "pt_namespace_title", unique: true
    t.index ["pt_timestamp"], name: "pt_timestamp"
  end

  create_table "querycache", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "qc_type", limit: 32, null: false
    t.integer "qc_value", default: 0, null: false, unsigned: true
    t.integer "qc_namespace", default: 0, null: false
    t.string "qc_title", default: "", null: false, collation: "utf8_bin"
    t.index ["qc_type", "qc_value"], name: "qc_type"
  end

  create_table "querycache_info", primary_key: "qci_type", id: :binary, limit: 32, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "qci_timestamp", limit: 14, default: "19700101000000", null: false
  end

  create_table "querycachetwo", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "qcc_type", limit: 32, null: false
    t.integer "qcc_value", default: 0, null: false, unsigned: true
    t.integer "qcc_namespace", default: 0, null: false
    t.string "qcc_title", default: "", null: false, collation: "utf8_bin"
    t.integer "qcc_namespacetwo", default: 0, null: false
    t.string "qcc_titletwo", default: "", null: false, collation: "utf8_bin"
    t.index ["qcc_type", "qcc_namespace", "qcc_title"], name: "qcc_title"
    t.index ["qcc_type", "qcc_namespacetwo", "qcc_titletwo"], name: "qcc_titletwo"
    t.index ["qcc_type", "qcc_value"], name: "qcc_type"
  end

  create_table "recentchanges", primary_key: "rc_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "rc_timestamp", limit: 14, default: "", null: false
    t.integer "rc_user", default: 0, null: false, unsigned: true
    t.string "rc_user_text", default: "", null: false, collation: "utf8_bin"
    t.bigint "rc_actor", default: 0, null: false, unsigned: true
    t.integer "rc_namespace", default: 0, null: false
    t.string "rc_title", default: "", null: false, collation: "utf8_bin"
    t.binary "rc_comment", limit: 767, default: "", null: false
    t.bigint "rc_comment_id", default: 0, null: false, unsigned: true
    t.integer "rc_minor", limit: 1, default: 0, null: false, unsigned: true
    t.integer "rc_bot", limit: 1, default: 0, null: false, unsigned: true
    t.integer "rc_new", limit: 1, default: 0, null: false, unsigned: true
    t.integer "rc_cur_id", default: 0, null: false, unsigned: true
    t.integer "rc_this_oldid", default: 0, null: false, unsigned: true
    t.integer "rc_last_oldid", default: 0, null: false, unsigned: true
    t.integer "rc_type", limit: 1, default: 0, null: false, unsigned: true
    t.string "rc_source", limit: 16, default: "", null: false, collation: "utf8_bin"
    t.integer "rc_patrolled", limit: 1, default: 0, null: false, unsigned: true
    t.binary "rc_ip", limit: 40, default: "", null: false
    t.integer "rc_old_len"
    t.integer "rc_new_len"
    t.integer "rc_deleted", limit: 1, default: 0, null: false, unsigned: true
    t.integer "rc_logid", default: 0, null: false, unsigned: true
    t.binary "rc_log_type", limit: 255
    t.binary "rc_log_action", limit: 255
    t.binary "rc_params"
    t.index ["rc_actor", "rc_timestamp"], name: "rc_actor"
    t.index ["rc_cur_id"], name: "rc_cur_id"
    t.index ["rc_ip"], name: "rc_ip"
    t.index ["rc_namespace", "rc_actor"], name: "rc_ns_actor"
    t.index ["rc_namespace", "rc_title", "rc_timestamp"], name: "rc_namespace_title_timestamp"
    t.index ["rc_namespace", "rc_type", "rc_patrolled", "rc_timestamp"], name: "rc_name_type_patrolled_timestamp"
    t.index ["rc_namespace", "rc_user_text"], name: "rc_ns_usertext"
    t.index ["rc_new", "rc_namespace", "rc_timestamp"], name: "new_name_timestamp"
    t.index ["rc_timestamp"], name: "rc_timestamp"
    t.index ["rc_user_text", "rc_timestamp"], name: "rc_user_text"
  end

  create_table "redirect", primary_key: "rd_from", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "rd_namespace", default: 0, null: false
    t.string "rd_title", default: "", null: false, collation: "utf8_bin"
    t.string "rd_interwiki", limit: 32
    t.string "rd_fragment", collation: "utf8_bin"
    t.index ["rd_namespace", "rd_title", "rd_from"], name: "rd_ns_title"
  end

  create_table "revision", primary_key: "rev_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=10000000 AVG_ROW_LENGTH=1024" do |t|
    t.integer "rev_page", null: false, unsigned: true
    t.integer "rev_text_id", default: 0, null: false, unsigned: true
    t.binary "rev_comment", limit: 767, default: "", null: false
    t.integer "rev_user", default: 0, null: false, unsigned: true
    t.string "rev_user_text", default: "", null: false, collation: "utf8_bin"
    t.binary "rev_timestamp", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.integer "rev_minor_edit", limit: 1, default: 0, null: false, unsigned: true
    t.integer "rev_deleted", limit: 1, default: 0, null: false, unsigned: true
    t.integer "rev_len", unsigned: true
    t.integer "rev_parent_id", unsigned: true
    t.binary "rev_sha1", limit: 32, default: "", null: false
    t.binary "rev_content_model", limit: 32
    t.binary "rev_content_format", limit: 64
    t.index ["rev_page", "rev_id"], name: "rev_page_id"
    t.index ["rev_page", "rev_timestamp"], name: "page_timestamp"
    t.index ["rev_page", "rev_user", "rev_timestamp"], name: "page_user_timestamp"
    t.index ["rev_timestamp"], name: "rev_timestamp"
    t.index ["rev_user", "rev_timestamp"], name: "user_timestamp"
    t.index ["rev_user_text", "rev_timestamp"], name: "usertext_timestamp"
  end

  create_table "revision_actor_temp", primary_key: ["revactor_rev", "revactor_actor"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "revactor_rev", null: false, unsigned: true
    t.bigint "revactor_actor", null: false, unsigned: true
    t.binary "revactor_timestamp", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.integer "revactor_page", null: false, unsigned: true
    t.index ["revactor_actor", "revactor_timestamp"], name: "actor_timestamp"
    t.index ["revactor_page", "revactor_actor", "revactor_timestamp"], name: "page_actor_timestamp"
    t.index ["revactor_rev"], name: "revactor_rev", unique: true
  end

  create_table "revision_comment_temp", primary_key: ["revcomment_rev", "revcomment_comment_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "revcomment_rev", null: false, unsigned: true
    t.bigint "revcomment_comment_id", null: false, unsigned: true
    t.index ["revcomment_rev"], name: "revcomment_rev", unique: true
  end

  create_table "searchindex", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "si_page", null: false, unsigned: true
    t.string "si_title", default: "", null: false
    t.text "si_text", limit: 16777215, null: false
    t.index ["si_page"], name: "si_page", unique: true
    t.index ["si_text"], name: "si_text", type: :fulltext
    t.index ["si_title"], name: "si_title", type: :fulltext
  end

  create_table "site_identifiers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "si_site", null: false, unsigned: true
    t.binary "si_type", limit: 32, null: false
    t.binary "si_key", limit: 32, null: false
    t.index ["si_key"], name: "site_ids_key"
    t.index ["si_site"], name: "site_ids_site"
    t.index ["si_type", "si_key"], name: "site_ids_type", unique: true
  end

  create_table "site_stats", primary_key: "ss_row_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "ss_total_edits", unsigned: true
    t.bigint "ss_good_articles", unsigned: true
    t.bigint "ss_total_pages", unsigned: true
    t.bigint "ss_users", unsigned: true
    t.bigint "ss_active_users", unsigned: true
    t.bigint "ss_images", unsigned: true
  end

  create_table "sites", primary_key: "site_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "site_global_key", limit: 32, null: false
    t.binary "site_type", limit: 32, null: false
    t.binary "site_group", limit: 32, null: false
    t.binary "site_source", limit: 32, null: false
    t.binary "site_language", limit: 32, null: false
    t.binary "site_protocol", limit: 32, null: false
    t.string "site_domain", null: false
    t.binary "site_data", null: false
    t.boolean "site_forward", null: false
    t.binary "site_config", null: false
    t.index ["site_domain"], name: "sites_domain"
    t.index ["site_forward"], name: "sites_forward"
    t.index ["site_global_key"], name: "sites_global_key", unique: true
    t.index ["site_group"], name: "sites_group"
    t.index ["site_language"], name: "sites_language"
    t.index ["site_protocol"], name: "sites_protocol"
    t.index ["site_source"], name: "sites_source"
    t.index ["site_type"], name: "sites_type"
  end

  create_table "slot_roles", primary_key: "role_id", id: :integer, limit: 2, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "role_name", limit: 64, null: false
    t.index ["role_name"], name: "role_name", unique: true
  end

  create_table "slots", primary_key: ["slot_revision_id", "slot_role_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "slot_revision_id", null: false, unsigned: true
    t.integer "slot_role_id", limit: 2, null: false, unsigned: true
    t.bigint "slot_content_id", null: false, unsigned: true
    t.bigint "slot_origin", null: false, unsigned: true
    t.index ["slot_revision_id", "slot_origin", "slot_role_id"], name: "slot_revision_origin_role"
  end

  create_table "tag_summary", primary_key: "ts_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ts_rc_id"
    t.integer "ts_log_id", unsigned: true
    t.integer "ts_rev_id", unsigned: true
    t.binary "ts_tags", null: false
    t.index ["ts_log_id"], name: "tag_summary_log_id", unique: true
    t.index ["ts_rc_id"], name: "tag_summary_rc_id", unique: true
    t.index ["ts_rev_id"], name: "tag_summary_rev_id", unique: true
  end

  create_table "templatelinks", primary_key: ["tl_from", "tl_namespace", "tl_title"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "tl_from", default: 0, null: false, unsigned: true
    t.integer "tl_from_namespace", default: 0, null: false
    t.integer "tl_namespace", default: 0, null: false
    t.string "tl_title", default: "", null: false, collation: "utf8_bin"
    t.index ["tl_from_namespace", "tl_namespace", "tl_title", "tl_from"], name: "tl_backlinks_namespace"
    t.index ["tl_namespace", "tl_title", "tl_from"], name: "tl_namespace"
  end

  create_table "text", primary_key: "old_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=10000000 AVG_ROW_LENGTH=10240" do |t|
    t.binary "old_text", limit: 16777215, null: false
    t.blob "old_flags", limit: 255, null: false
  end

  create_table "transcache", primary_key: "tc_url", id: :binary, limit: 255, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "tc_contents"
    t.binary "tc_time", limit: 14, null: false
  end

  create_table "updatelog", primary_key: "ul_key", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.binary "ul_value"
  end

  create_table "uploadstash", primary_key: "us_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "us_user", null: false, unsigned: true
    t.string "us_key", null: false
    t.string "us_orig_path", null: false
    t.string "us_path", null: false
    t.string "us_source_type", limit: 50
    t.binary "us_timestamp", limit: 14, null: false
    t.string "us_status", limit: 50, null: false
    t.integer "us_chunk_inx", unsigned: true
    t.binary "us_props"
    t.integer "us_size", null: false, unsigned: true
    t.string "us_sha1", limit: 31, null: false
    t.string "us_mime"
    t.string "us_media_type", limit: 10
    t.integer "us_image_width", unsigned: true
    t.integer "us_image_height", unsigned: true
    t.integer "us_image_bits", limit: 2, unsigned: true
    t.index ["us_key"], name: "us_key", unique: true
    t.index ["us_timestamp"], name: "us_timestamp"
    t.index ["us_user"], name: "us_user"
  end

  create_table "user", primary_key: "user_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_name", default: "", null: false, collation: "utf8_bin"
    t.string "user_real_name", default: "", null: false, collation: "utf8_bin"
    t.blob "user_password", limit: 255, null: false
    t.blob "user_newpassword", limit: 255, null: false
    t.binary "user_newpass_time", limit: 14
    t.text "user_email", limit: 255, null: false
    t.binary "user_touched", limit: 14, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.binary "user_token", limit: 32, default: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000", null: false
    t.binary "user_email_authenticated", limit: 14
    t.binary "user_email_token", limit: 32
    t.binary "user_email_token_expires", limit: 14
    t.binary "user_registration", limit: 14
    t.integer "user_editcount"
    t.binary "user_password_expires", limit: 14
    t.index ["user_email"], name: "user_email", length: { user_email: 50 }
    t.index ["user_email_token"], name: "user_email_token"
    t.index ["user_name"], name: "user_name", unique: true
  end

  create_table "user_former_groups", primary_key: ["ufg_user", "ufg_group"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ufg_user", default: 0, null: false, unsigned: true
    t.binary "ufg_group", limit: 255, default: "", null: false
  end

  create_table "user_groups", primary_key: ["ug_user", "ug_group"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ug_user", default: 0, null: false, unsigned: true
    t.binary "ug_group", limit: 255, default: "", null: false
    t.binary "ug_expiry", limit: 14
    t.index ["ug_expiry"], name: "ug_expiry"
    t.index ["ug_group"], name: "ug_group"
  end

  create_table "user_newtalk", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.binary "user_ip", limit: 40, default: "", null: false
    t.binary "user_last_timestamp", limit: 14
    t.index ["user_id"], name: "un_user_id"
    t.index ["user_ip"], name: "un_user_ip"
  end

  create_table "user_properties", primary_key: ["up_user", "up_property"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "up_user", null: false, unsigned: true
    t.binary "up_property", limit: 255, null: false
    t.binary "up_value"
    t.index ["up_property"], name: "user_properties_property"
  end

  create_table "valid_tag", primary_key: "vt_tag", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "watchlist", primary_key: "wl_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "wl_user", null: false, unsigned: true
    t.integer "wl_namespace", default: 0, null: false
    t.string "wl_title", default: "", null: false, collation: "utf8_bin"
    t.binary "wl_notificationtimestamp", limit: 14
    t.index ["wl_namespace", "wl_title"], name: "namespace_title"
    t.index ["wl_user", "wl_namespace", "wl_title"], name: "wl_user", unique: true
    t.index ["wl_user", "wl_notificationtimestamp"], name: "wl_user_notificationtimestamp"
  end

end
