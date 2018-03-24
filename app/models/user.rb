class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :destinations
  has_many :user_items
  has_many :orders

### ユーザー情報のバリデーション ###
  validates :last_name,	presence: true
  validates :last_name_kana, presence: true,
  			format: { with: /\A[ァ-ンー－]+\z/}
  validates :first_name, presence: true
  validates :first_name_kana, presence: true,
  			format: { with: /\A[ァ-ンー－]+\z/}
  validates :postal_code, presence: true,
  			format: { with: /\A\d{7}\z/ }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true,
  			uniqueness: true,
  			format: { with: /\A\d{10}\z|^\d{11}\z/ }
  validates :email, presence: true,
  			uniqueness: true,
  			format: { with: /\A\S+@\S+\.\S+\z/ }


### kakurenbo-puti ###

soft_deletable

###emailに関する検証を一旦削除###
  _validators.delete(:email)
  _validate_callbacks.each do |callback|
  	if callback.raw_filter.respond_to? :attributes
  		callback.raw_filter.attributes.delete :email
  	end
  end

###emailのバリデーションを再定義###
  validates :email, presence: true
  validates_format_of :email, with: Devise.email_regexp, if: :email_changed?
  validates_uniqueness_of :email, scope: :soft_destroyed_at, if: :email_changed?

###論理削除済みユーザーのログイン不可設定###
  def self.find_for_authentication(warden_conditions)
  	without_soft_destroyed.where(email: warden_conditions[:email]).first
  end

### 都道府県用 enum ###
  enum prefecture: {  北海道: 0,
						青森県: 1,
						岩手県: 2,
						宮城県: 3,
						秋田県: 4,
						山形県: 5,
						福島県: 6,
						茨城県: 7,
						栃木県: 8,
						群馬県: 9,
						埼玉県: 10,
						千葉県: 11,
						東京都: 12,
						神奈川県: 13,
						新潟府: 14,
						富山県: 15,
						石川県: 16,
						福井県: 17,
						山梨県: 18,
						長野県: 19,
						岐阜県: 20,
						静岡県: 21,
						愛知県: 22,
						三重県: 23,
						滋賀県: 24,
						京都府: 25,
						大阪府: 26,
						兵庫県: 27,
						奈良県: 28,
						和歌山県: 29,
						鳥取県: 30,
						島根県: 31,
						岡山県: 32,
						広島県: 33,
						山口県: 34,
						徳島県: 35,
						香川県: 36,
						愛媛県: 37,
						高知県: 38,
						福岡県: 39,
						佐賀県: 40,
						長崎府: 41,
						熊本県: 42,
						大分県: 43,
						宮崎県: 44,
						鹿児島県: 45,
						沖縄県: 46
					}
end
