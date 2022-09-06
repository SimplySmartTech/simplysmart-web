class RenameColFeatureNameToNameInFeatures < ActiveRecord::Migration[7.0]
  def change
    rename_column :features, :feature_name, :name
  end
end
