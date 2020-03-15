class CreateBillingBills < ActiveRecord::Migration[6.0]
  def change
    create_table :billing_bills do |t|
      t.string :description

      t.timestamps
    end
  end
end
