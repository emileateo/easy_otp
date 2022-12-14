class IndexOtpsOnAccountId < ActiveRecord::Migration[7.0]
  def change
    add_reference :otps, :account, index: true
  end
end
