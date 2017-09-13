class CreateGroupEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :group_events do |t|
      t.string    :name
      t.string    :description
      t.string    :location
      t.datetime  :starts_at
      t.datetime  :ends_at
      t.boolean   :published, default: false
      t.timestamps
    end
  end
end
