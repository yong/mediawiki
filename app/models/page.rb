#https://www.mediawiki.org/wiki/Manual:Page_table
#
#The page table can be considered the "core of the wiki". Each page in a
#MediaWiki installation has an entry here which identifies it by title and
#contains some essential metadata.
#The text of the page itself is stored in the text table. To retrieve the text
#of an article, MediaWiki first searches for page_title in the page table. Then,
# page_latest is used to search the revision table for rev_id, and rev_text_id
#is obtained in the process. The value obtained for rev_text_id is used to
#search for old_id in the text table to retrieve the text. When a page is
#deleted, the revisions are moved to the archive table.
class Page < ApplicationRecord
  self.table_name = "page"
  self.primary_key = "page_id"

  has_many :externallinks
  has_many :revisions, foreign_key: "rev_id"
end
