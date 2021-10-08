class Blog < ApplicationRecord
  has_many :posts, :dependent => :delete_all 

  validates :name, :description, presence: true

  after_destroy :destroy_all_post_for_this_blog

  def destroy_all_post_for_this_blog()
    self.posts.destroy_all
  end

end
