class ChangeColumDefaultValueRole < ActiveRecord::Migration
  def change
      change_column_default :users, :role, "guest"
  end
end
