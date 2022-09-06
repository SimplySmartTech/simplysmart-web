class RenameColImageUrlToAttachmentUrlInAttachments < ActiveRecord::Migration[7.0]
  def change
    rename_column :attachments, :image_url, :attachment_url
  end
end
