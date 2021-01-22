class AddAttributesToChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :description, :text
    add_column :channels, :profile_image_url, :string
  end
end
