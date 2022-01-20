class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exercises, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"

  validates :first_name, :last_name, presence: true

  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) || self == new_friend
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search_by_name(name)
    names_array = name.split(" ")

    if names_array.size == 1
      where("first_name LIKE ? or last_name LIKE ?",
        "%#{names_array[0]}%", "%#{names_array[0]}%").order(:first_name)
    else
      where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?', 
        "%#{names_array[0]}%", "%#{names_array[1]}%", "%#{names_array[0]}%", "%#{names_array[1]}%").order(:first_name)
    end
  end
end
