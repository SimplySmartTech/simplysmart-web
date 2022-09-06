class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.string :image_url
      t.references :service, foreign_key: true
      t.timestamps
    end
  end
end
