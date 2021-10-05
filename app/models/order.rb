class ResidencePurchaseHistories
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :address, :building_name, :telephone, :purchase_history :purchase_histories_id, :user_id, :item_id

  def save
  end
end