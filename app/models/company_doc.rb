class CompanyDoc < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :company_document, :uploader_id, :uploader_type, :company_forum_id

  has_attached_file :company_document

  belongs_to :company_forum
end
