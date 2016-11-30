json.extract! order, :id, :order_number, :order_date, :total, :order_status, :payment_mode, :user_id, :address_id, :created_at, :updated_at
json.url order_url(order, format: :json)