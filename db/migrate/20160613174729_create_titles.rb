class CreateTitles < ActiveRecord::Migration
  def up
    create_table :titles do |t|
      t.string :name
    end
  end
  def down
    drop_table :titles
  end
end

