class CreateHqSchema < ActiveRecord::Migration
  def up
    execute 'CREATE SCHEMA hq'
  end

  def down
    execute 'DROP SCHEMA hq'
  end
end
