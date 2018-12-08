class CreateVerifications < ActiveRecord::Migration[5.1]
  def change
    create_table :verifications do |t|
      t.string :phone_number
      t.string :code
    end
  end
end
