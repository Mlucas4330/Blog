class AddJwtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jwt_token, :string
    add_column :users, :jwt_expiration, :datetime
  end
end
