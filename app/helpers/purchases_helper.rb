module PurchasesHelper
  def unpaid(payment_date)
    if payment_date == nil
      return "unpaid"
    end
  end
end
