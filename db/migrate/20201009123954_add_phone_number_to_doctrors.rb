class AddPhoneNumberToDoctrors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :phone_number, :string
  end
end
