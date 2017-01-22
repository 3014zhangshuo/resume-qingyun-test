class FixResumeAasmDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:resumes, :aasm_state, "drafting")
  end
end
