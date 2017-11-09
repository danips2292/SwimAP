class AddRemotePathToVideos < ActiveRecord::Migration[5.0]
  def change
  	 add_column :videos, :remote_path, :string
  end
end
