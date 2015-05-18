class AddBoxViewUrlToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :box_view_url, :string
  end
end
