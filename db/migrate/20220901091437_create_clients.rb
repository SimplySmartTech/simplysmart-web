class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, default: "-"
      t.string :logo_image, default: "-"
      t.timestamps
    end
  end
end
