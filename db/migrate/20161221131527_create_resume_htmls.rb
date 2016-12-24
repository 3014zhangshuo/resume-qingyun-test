class CreateResumeHtmls < ActiveRecord::Migration[5.0]
  def change
    create_table :resume_htmls do |t|
      t.integer :resume_id
      t.text :content

      t.timestamps
    end
  end
end
