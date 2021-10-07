class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :address, :building_name, :telephone, :prefecture_id, :purchase_history_id, :user_id, :item_id, :token

  with_options presence: true
    validates :postal_code, format:{with:/\A\d{3}[-]\d{4}\z/}
    validates :municipalities
    validates :telephone, format:{with:/\A\d[0-9]{9,10}\z/}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :address
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code, municipalities: municipalities, address: address, building_name: building_name, telephone: telephone, prefecture_id: prefecture_id, purchase_history_id: purchase_history.id)
  end
end