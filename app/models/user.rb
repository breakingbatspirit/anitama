class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses,dependent: :destroy
  has_many :chats,dependent: :destroy
  has_many :cart_items,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :histories,dependent: :destroy
  # idを持たないfavoriteのtrue/falseを確認するため、仮想の中間テーブルを作る = favorite_cds
  has_many :favorite_cds, through: :favorites, source: :cd
  acts_as_paranoid
  attachment :image
end

