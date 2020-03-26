class Order < ApplicationRecord
	enum payment_method:{クレジットカード: 0,銀行振り込み: 1}
	enum address_status:{ご自身の住所: 0, 登録済住所から選択: 1, 新しいお届け先: 2 }
	enum order_stauts:{入金待ち: 0,入金確認: 1,制作中: 2,発送準備中: 3,発送済み: 4}
	enum confirm_status:{注文確定前: 0,注文確定済み: 1}
	belongs_to :end_user
	has_many :order_details, dependent: :destroy
end
