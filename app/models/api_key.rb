class ApiKey < ApplicationRecord
  belongs_to :created_by, class_name: :User, inverse_of: :api_keys

  validates :key, :expires_in_days, presence: true

  before_validation :set_key

  def set_key
    self.key = SecureRandom.base64(20) if key.blank?
  end

  def expired?
    created_at + expires_in_days.days < Time.current
  end
end

# == Schema Information
#
# Table name: api_keys
#
#  id              :uuid             not null, primary key
#  expires_in_days :integer          default(31)
#  key             :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  created_by_id   :uuid             not null
#
# Indexes
#
#  index_api_keys_on_created_by_id  (created_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id)
#
