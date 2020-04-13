class OptionalField < ApplicationRecord
  belongs_to :user

  validates :field, presence: true, length: { maximum: 30 }
  validates :value, presence: true, length: { maximum: 128 }
  validate :validate_quota

  def validate_quota
    return unless user

    errors.add(:user_id, "already has the maximum allowable optional fields") unless user.optional_fields.count < 3
  end
end
