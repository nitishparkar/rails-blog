class AddPaperclipToAssets < ActiveRecord::Migration
  def change
    add_attachment :assets, :usrfile
  end
end
