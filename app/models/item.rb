class Item < ApplicationRecord
	attachment :image
	belongs_to :genre
	enum sale_status:{販売中: 0,販売停止中:1}

	has_many :cart_items, dependent: :destroy
end
