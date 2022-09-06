class RemoveColVideoUrlFromServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :video_url
  end
end
