class AddOccupationToTester < ActiveRecord::Migration[5.0]
  def change
		add_column :testers, :occupation, :string
  end
end
