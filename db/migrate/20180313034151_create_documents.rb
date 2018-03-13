class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :subject
      t.text :body
      t.integer :state, default: 0, null: false

      t.timestamps
    end
    add_index :documents, :subject
    add_index :documents, :state
  end
end
