class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :no_username

  def no_username(attributes)
    attributes['username'].blank?
  end
end
