class Book < ApplicationRecord

	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy

	attachment :profile_image, destroy: false

	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end
	# favorited_by?メソッド
	# このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます
	# 存在していればtrue、存在していなければfalseを返すようにしています。

	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
