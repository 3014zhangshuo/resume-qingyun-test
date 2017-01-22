class AddAasmToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :aasm_state, :string, default: "submit_one"
    add_index  :resumes, :aasm_state
  end
end
