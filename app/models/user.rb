class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥々]\z/}
  validates :family_name_kana, format: {with: /\A[ァ-ンー]+\z/}
  validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥々]\z/}
  validates :first_name_kana, format: {with: /\A[ァ-ンー]+\z/}
  validates :birthday, presence: true
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
end
