class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :condition 
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shopping_cost
  belongs_to :trading_status

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :trading_status_id
    validates :prefecture_id
    validates :shopping_cost_id
  end

  validates_inclusion_of :price, in: 300..9_999_999

  validates :price, numericality: { with: /\A[0-9]+\z/ }

  has_one_attached :image


  def was_attached?
    self.image.attached?
  end

  has_one :order
  belongs_to_active_hash :prefecture

  has_one :item_order


end
