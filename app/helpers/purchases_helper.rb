# frozen_string_literal: true

module PurchasesHelper
  def unpaid(payment_date)
    return 'unpaid' if payment_date.nil?
  end
end
