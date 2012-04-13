class Char < ActiveRecord::Base
  belongs_to :glyph
  has_and_belongs_to_many :sounds
  has_many :references
  belongs_to :script

  has_ancestry

  validates :name, :script, :glyph, :sound_ids, :presence => true

  def self.search(search)
    if search
      where('chars.name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
