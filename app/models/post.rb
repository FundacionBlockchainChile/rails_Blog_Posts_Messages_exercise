class Post < ApplicationRecord
  belongs_to :blog
  has_many :messages, :dependent => :delete_all 

  validates :title, :content, presence: true, length: {minimum: 7}

  after_destroy :destroy_all_messages_of_this_post

  def destroy_all_messages_of_this_post()
    self.messages.destroy_all
  end
end
