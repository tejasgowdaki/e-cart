json.extract! order_line_item, :id, :price, :quantity, :order_id, :product_id, :user_profile_id, :created_at, :updated_at
json.url order_line_item_url(order_line_item, format: :json)