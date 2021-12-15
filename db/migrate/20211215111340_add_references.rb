class AddReferences < ActiveRecord::Migration[5.1]
  def change
    add_reference :bugs, :creator, foreign_key:{to_table: :users}
    add_reference :bugs, :solver, foreign_key:{to_table: :users}

    add_reference :projects, :manager, foreign_key:{to_table: :users}
  end
end
