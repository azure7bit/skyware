class CompanyDoc < ActiveRecord::Base
  # attr_accessible :title, :body
  # attr_accessible :company_document, :uploader_id, :uploader_type

  has_attached_file :company_document
  validates :company_document, :attachment_presence => true
  validates_presence_of :uploader_id
  def as_json(options={})
  	super(options.merge(methods: [:document_url]))
  end
  def document_url
  	company_document.url
  end
end
