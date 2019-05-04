class AddDefaultValueToPlayerInjured < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :injured, :boolean, default: false
  end
end
