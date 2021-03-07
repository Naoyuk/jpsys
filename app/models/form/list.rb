# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id             :integer          not null, primary key
#  order_id       :integer          not null
#  item_id        :integer          not null
#  amount         :integer          not null
#  list_price     :integer
#  discount       :integer          default: 0
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Form::List < List
  REGISTRABLE_ATTRIBUTES = %i(id item_id amount list_price discount)

  def selectable_items
    Item.all
  end

  def calculate_list_price
    self.list_price = list_price * amount - discount
  rescue
    self.list_price = 0
  end
end
