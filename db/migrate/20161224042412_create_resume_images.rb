class CreateResumeImages < ActiveRecord::Migration[5.0]
  def change
    create_table :resume_images do |t|
      t.integer :resume_id
      t.string :content

      t.timestamps
    end
  end
end
