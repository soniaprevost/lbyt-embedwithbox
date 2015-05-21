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


  def box_viewer
    box_document = generate_box_document
    generate_box_session(box_document['id'])
  end

  def generate_box_document
    response = HTTParty.post('https://view-api.box.com/1/documents',
      headers: {
        'Authorization' => "Token #{ENV['BOX_VIEW_API_KEY']}",
        'Content-Type' => 'application/json',
      },
      body:
      {
        url: doc.url,
        name: doc.name
      }.to_json
    )
  end

  def generate_box_session(document_id)
    session = HTTParty.post('https://view-api.box.com/1/sessions',
      headers: {
        'Authorization' => "Token #{ENV['BOX_VIEW_API_KEY']}",
        'Content-Type' => 'application/json',
      },
      body: {
        document_id: document_id,
        expires_at: 90.days.from_now,
        is_downloadable: true,
      }.to_json
    )

    if session.response.code == '201'
      self.update_column(:box_view_url, session['urls']['view'])
    elsif session.response.code == '202'
      generate_box_session(document_id)
    else
      raise "error while loading, try to upload your doc again"
    end

  end


end
