class UpdateColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :features, :feature_name, :name
    rename_column :attachments, :image_url, :attachment_url
  end
end
