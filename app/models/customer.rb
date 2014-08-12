class Customer < ActiveRecord::Base
  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items

  before_validation :downcase_email
  before_validation :upcase_state

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/, allow_blank: true }
  validates :state, inclusion: %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
  validates :zip_code, format: { with: /\d{5,}/, allow_blank: true }

  private
  def downcase_email
    self.email = email.to_s.downcase
  end

  def upcase_state
    self.state = state.to_s.upcase
  end
end
