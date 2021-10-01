class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :items_condition
  belongs_to :postage_load
  belongs_to :prefecture
  belongs_to :shipment_day
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :items_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_load_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true
end
