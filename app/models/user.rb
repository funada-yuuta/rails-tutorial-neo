class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable, :omniauthable
  
  validates :name, presence: true,
                   length: { maximum: 50 }

  def feed
    Micropost.where("user_id = ?", id)
  end
end