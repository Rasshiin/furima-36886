class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :items_sondition
  belongs_to :postage_load
  belongs_to :prefecture
  belongs_to :shipment_day

  validates :category_id, numericality: { other_than: 1 }
  validates :items_sondition_id, numericality: { other_than: 1 }
  validates :postage_load_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipment_day_id, numericality: { other_than: 1 }
end
