class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :service_name
      t.string :service_info
      t.string :video_url
      t.timestamps
    end
  end
end
