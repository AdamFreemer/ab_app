class Update < ActiveRecord::Migration
  def change
    remove_column :clips, :session_browser_platform
    remove_column :clips, :session_browser_name
    remove_column :clips, :session_browser_version
    remove_column :clips, :session_ip

    add_column :votes, :session_browser_platform, :string
    add_column :votes, :session_browser_name, :string
    add_column :votes, :session_browser_version, :string
    add_column :votes, :session_ip, :string

    remove_column :votes, :name
    remove_column :votes, :author
    remove_column :votes, :url
    remove_column :votes, :format

    add_column :clips, :name, :string
    add_column :clips, :author, :string
    add_column :clips, :file_name, :string
    add_column :clips, :format, :string
  end
end
