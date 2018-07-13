#https://www.mediawiki.org/wiki/Manual:Externallinks_table
class Externallink < ApplicationRecord
  self.primary_key = "el_id"

  belongs_to :page, foreign_key: "el_from"
end
