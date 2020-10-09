class AddAttachmentImageToSermons < ActiveRecord::Migration[6.0]
  def self.up
    change_table :sermons do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sermons, :image
  end
end
