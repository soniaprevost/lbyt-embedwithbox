class Document < ActiveRecord::Base

  validates :name, presence: true

  has_attached_file :doc

  validates_attachment_content_type :doc, content_type: [
    "application/pdf",
    "application/msword",
    "application/vnd.oasis.opendocument.text",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "application/vnd.ms-powerpoint",
    "application/vnd.openxmlformats-officedocument.presentationml.presentation",
    "text/css",
    "application/javascript",
  ]

end
