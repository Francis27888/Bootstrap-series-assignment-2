class ChangeImageTypeInBlogs < ActiveRecord::Migration[5.1]
  def change
    change_column :blogs, :image, :text
  end
end
