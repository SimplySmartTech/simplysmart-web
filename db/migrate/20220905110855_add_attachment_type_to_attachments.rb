class AddAttachmentTypeToAttachments < ActiveRecord::Migration[7.0]
  def change
    add_column :attachments, :attachment_type, :integer
  end
end
