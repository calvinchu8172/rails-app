class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :source, index: true, polymorphic: true, null: false
      t.references :target, index: true, polymorphic: true
      t.string     :event,  index: true, null: false
      t.text       :extra

      t.timestamps null: false
    end
    add_index :logs, :created_at
    add_index :logs, :updated_at
  end
end
