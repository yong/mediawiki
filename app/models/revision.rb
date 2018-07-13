#https://www.mediawiki.org/wiki/Manual:Revision_table
#
#The revision table holds metadata for every edit done to a page within the
#wiki. Every edit of a page creates a revision row, which holds information
#such as the user who made the edit, the time at which the edit was made, and
#a reference to the new wikitext in the text table.
class Revision < ApplicationRecord
  self.table_name = "revision"
  self.primary_key = "rev_id"

  belongs_to :page, foreign_key: "rev_page"

  belongs_to :revision, foreign_key: "rev_parent_id"
  belongs_to :text, foreign_key: "rev_text_id"
end
