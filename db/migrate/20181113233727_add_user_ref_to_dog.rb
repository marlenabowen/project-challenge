class AddUserRefToDog < ActiveRecord::Migration[5.2]
  def change
    add_reference :dogs, :user, index: true
  end
end
