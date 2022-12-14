class CreateOtps < ActiveRecord::Migration[7.0]
  def change
    create_table :otps do |t|
      t.string :otp

      t.timestamps
    end
  end
end
