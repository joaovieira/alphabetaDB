class Script < ActiveRecord::Base
  has_many :chars
  has_many :references
  belongs_to :script
end
