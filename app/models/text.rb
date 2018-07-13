#https://www.mediawiki.org/wiki/Manual:Text_table
#
#The text table holds the wikitext of individual page revisions.
#
#old_id
#Unique integer used to identify each text. revision.rev_text_id in revision table and archive table. ar_text_id are keys to this column.
#
#old_text
#The wikitext of the page, or a pointer to external storage of the form of DB://cluster/id.
#
#old_flags
#Comma-separated list of flags.
class Text < ApplicationRecord
  self.table_name = "text"
  self.primary_key = "old_id"

  has_one :revision, foreign_key: "rev_text_id"
end
