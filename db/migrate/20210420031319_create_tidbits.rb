class CreateTidbits < ActiveRecord::Migration[6.1]
  def change
    create_table :tidbits do |t|

      t.timestamps
    end
  end
end
