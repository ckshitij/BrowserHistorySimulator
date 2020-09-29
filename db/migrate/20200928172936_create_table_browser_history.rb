class CreateTableBrowserHistory < ActiveRecord::Migration[5.2]
  def change
    create_table :browser_histories do |t|
      t.string :url
      t.integer :sequence
      
      t.timestamps
    end
  end
end
