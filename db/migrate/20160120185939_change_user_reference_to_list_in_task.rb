class ChangeUserReferenceToListInTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :user_id, :integer
    add_reference :tasks, :list, index: true
  end
end
