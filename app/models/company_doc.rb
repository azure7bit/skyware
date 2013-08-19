class CompanyDoc < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :company_document, :uploader_id, :uploader_type, :company_forum_id

  has_attached_file :company_document
  validates :company_document, :attachment_presence => true
  validates_presence_of :uploader_id
  belongs_to :company_forum
end
