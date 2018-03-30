class CreateMarkets < ActiveRecord::Migration[5.1]
  def change
    create_table :markets do |t|
      t.string :otcbtc_id
      t.string :ticker_id
      t.string :name
      t.string :current_buy

      t.timestamps
    end

    add_index :markets, :otcbtc_id
  end
end
