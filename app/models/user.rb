class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  
  with_options presence: true,format: { with:/\A[ァ-ヶー－]+\z/} do
   validates :family_name_kana
   validates :first_name_kana
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :family_name
    validates :first_name
 end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX} ,length: { minimum: 8}
  validates :password, confirmation: true
  

  has_many :items_users
  has_many :items
  has_many :orders
  has_one :card, dependent: :destroy
end
