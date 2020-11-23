class Address < ApplicationRecord
  with_options presence: true do
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Include hyphen(-)"}
    validates :building_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
end
