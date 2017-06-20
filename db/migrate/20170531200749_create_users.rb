class CreateUsers < ActiveRecord::Migration[5.1]
  #changeとup,downでやる方法の違いがわかってない
  def change
    create_table :users do |u|
      u.string :name, null: false
      #password_digestで暗号化
      u.string :password_digest, null: false
      u.string :email, null: false
      u.string :created_at, :updated_at
    end
  end
end






