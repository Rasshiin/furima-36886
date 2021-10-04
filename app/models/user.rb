class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/} do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: {with: /\A[ァ-ンー]+\z/} do
  validates :family_name_kana
  validates :first_name_kana
  end
end
