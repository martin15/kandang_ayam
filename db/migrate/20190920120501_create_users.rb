class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string    :name
      t.string    :email
      t.string    :password_digest
      t.string    :token
      t.datetime  :token_expired
      t.string    :uuid
      t.timestamps
    end
  end
end
