class Address < ApplicationRecord
	belongs_to :end_user

	def haisousaki
		self.postal_code + self.domicile + self.name
	end
end
