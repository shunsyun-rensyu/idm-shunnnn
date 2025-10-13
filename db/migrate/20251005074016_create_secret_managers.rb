class CreateSecretManagers < ActiveRecord::Migration[7.1]
  def change
    create_table :secret_managers do |t|
      t.string :where
      t.string :who
      t.string :what
      t.date :when

      t.timestamps
    end
  end
end
