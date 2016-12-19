class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.integer    :role, index: true, default: 0, null: false
      t.string     :name

      t.timestamps null: false
    end
  end
end
