class Residence < ApplicationRecord
  belongs_to :purchase_history

  # validates :purchase_histories_id, presence: true
end
