class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :address, :building_name, :telephone, :prefecture_id, :purchase_history_id, :user_id, :item_id

  validates :postal_code, format:{with:/\A\d{3}[-]\d{4}\z/}
  validates :municipalities, presence: true
  validates :telephone, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code, municipalities: municipalities, address: address, building_name: building_name, telephone: telephone, prefecture_id: prefecture_id, purchase_history_id: purchase_history.id)
  end
end