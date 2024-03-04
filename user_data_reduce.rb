users = [
  { id: 2, email: 'guru@drylogics.com', name: 'Guru Pradeep' },
  { id: 4, email: 'rajesh@drylogics.com', name: 'Rajesh Khanna' },
  { id: 6, email: 'malathi@drylogics.com', name: 'Malathi Raj' },
  { id: 10, email: 'sasirekha@drylogics.com', name: 'Sasirekha Ponnusami' },
  { id: 15, email: 'keerthana@drylogics.com', name: 'Keerthana Karthi' }
]
orders = [
  { id: 2, buyer: 'Jones', name: 'Jones Winter Collection 2023', assignee: 15, delivery_date: '2023-11-10' },
  { id: 3, buyer: 'Rainer', name: 'Rainer Collection 2023', assignee: 10, delivery_date: '2023-12-14' },
  { id: 4, buyer: 'Jones', name: 'Towels and Napkins 4', assignee: 6, delivery_date: '2024-02-22' },
  { id: 5, buyer: 'Sharon', name: "Sharon's Winter Collection 2023", assignee: 4, delivery_date: '2023-11-30' },
  { id: 6, buyer: 'Rainer', name: 'Rainer Collection 2024', assignee: 2, delivery_date: '2024-04-04' },
  { id: 7, buyer: 'Kimberly', name: 'Kims Sprint Collection 2024', assignee: 4, delivery_date: '2024-01-02' },
  { id: 8, buyer: 'Jones', name: 'Jones Spring Collection 2024', assignee: 15, delivery_date: '2024-02-01' },
  { id: 9, buyer: 'Jones', name: 'Jones Kids Collection 2023', assignee: 6, delivery_date: '2023-12-10' },
  { id: 10, buyer: 'Kimberly', name: "Kim's Winter Collection 2023", assignee: 4, delivery_date: '2023-11-15' },
  { id: 11, buyer: 'Sharon', name: 'Sharon Winter Collection 2023', assignee: 10, delivery_date: '2023-11-20' },
  { id: 12, buyer: 'Rainer', name: 'Rainer Christmas 2023', assignee: 15, delivery_date: '2023-12-03' },
  { id: 13, buyer: 'Jones', name: 'Jones December 2023', assignee: 2, delivery_date: '2023-12-10' }
]
buyers = [
  { name: 'Jones', country: 'USA', currency: 'USD' },
  { name: 'Rainer', country: 'USA', currency: 'USD' },
  { name: 'Sharon', country: 'UK', currency: 'GBP' },
  { name: 'Kimberly', country: 'France', currency: 'EURO' }
]

# Questions:
# 1 Find all order that ought to be delivered in next 15 days.

def next_15_days_orders(orders)
  require 'date'
  today_date = Date.today
  today = today_date + 15
  orders.each_with_object([]) do |order, result|
    Date.parse(order[:delivery_date]) <= today && result << { id: order[:id], buyer: order[:buyer], name: order[:name],
                                                              assignee: order[:assignee], delivery_date: order[:delivery_date] }
  end
end
puts "1.Next 15 days orders:\n #{next_15_days_orders(orders).join("\n")}"

# Next 15 days orders:
# {:id=>2, :buyer=>"Jones", :name=>"Jones Winter Collection 2023", :assignee=>15, :delivery_date=>"2023-11-10"}
# {:id=>10, :buyer=>"Kimberly", :name=>"Kim's Winter Collection 2023", :assignee=>4, :delivery_date=>"2023-11-15"}
# {:id=>11, :buyer=>"Sharon", :name=>"Sharon Winter Collection 2023", :assignee=>10, :delivery_date=>"2023-11-20"}

# 2 Find buyers who have orders in the next year.

def buyers_name_have_orders_in_next_year(orders)
  require 'date'
  orders.reduce([]) do |buyers_name, order|
    Date.parse(order[:delivery_date]).year == Date.today.year + 1 && buyers_name << order[:buyer]
    buyers_name.uniq
  end
end
puts "2.Buyers have orders in next year: \n #{buyers_name_have_orders_in_next_year(orders).join("\n")}"

# output:
# Buyers have orders in next year:
# ["Jones", "Rainer", "Kimberly"]

# 3 Find assignees[names] who are handling more than 2 orders

def assignees_handling_more_than_2_orders(orders, users)
  orders_data = orders.each_with_object({}) do |order, groupings| # first reduce to group by assignee
    key = order[:assignee]
    groupings[key] = [] unless groupings.key? key
    groupings[key] << order
  end
  orders_data.each_with_object([]) do |(assignee_id, values), result| # then
    if values.count > 2
      user = users.find { |person| person[:id] == assignee_id }
      result << { name: user[:name], email: user[:email], orders_count: values.count }
    end
  end
end

puts "3.Assignees Handling More than 2 orders: \n #{assignees_handling_more_than_2_orders(orders, users).join("\n")}"

# output:
# Assignees Handling More than 2 orders:
# {:name=>"Keerthana Karthi", :email=>"keerthana@drylogics.com", :orders_count=>3}
# {:name=>"Rajesh Khanna", :email=>"rajesh@drylogics.com", :orders_count=>3}

# 4 Find assignees[names] who are handling orders for Jones

def assignee_handling_orders_for_johnes(orders, users)
  orders.reduce([]) do |assignee_names, order|
    user = users.find { |person| person[:id] == order[:assignee] }
    order[:buyer] == 'Jones' && assignee_names << { assignee_name: user[:name] }
    assignee_names.uniq
  end
end
puts "4.Assignee handling order for Jones: \n #{assignee_handling_orders_for_johnes(orders, users).join("\n")}"
# output:
# Assignee names handling order for Jones:
# {:name_of_assignee=>"Keerthana Karthi"}
# {:name_of_assignee=>"Malathi Raj"}
# {:name_of_assignee=>"Guru Pradeep"}

# 5 Give me number of orders for each buyer.

def order_counts_for_each_buyer(orders)
  orders.each_with_object(Hash.new(0)) do |order, count|
    count[order[:buyer]] += 1
  end
end
puts "5.Number of orders for each buyer: \n #{order_counts_for_each_buyer(orders)}"

# #output:
# Number of orders for each buyer:
# {"Jones"=>5, "Rainer"=>3, "Sharon"=>2, "Kimberly"=>2}

# 6 Make the following table ordered by delivery date in descending order
#     column1: Order Name
#     column2: buyer name
#     column3: assignee name
#     column4: assignee email id
#     column5: delivery  date

def table_ordered_by_delivery_date_in_descending_order(orders, users)
  orders.sort { |a, b| b[:delivery_date] <=> a[:delivery_date] }
        .each_with_object([]) do |order, updated_data|
          user_data = users.find { |user| user[:id] == order[:assignee] }
          updated_data << [order[:name], order[:buyer], user_data[:name], user_data[:email], order[:delivery_date]]
        end
end
puts "6.Table_ordered_by_delivery_date_in_descending_order: \n #{table_ordered_by_delivery_date_in_descending_order(
  orders, users
)}"

# #output:

# [["Rainer Collection 2024", "Rainer", "Guru Pradeep", "guru@drylogics.com", "2024-04-04"],
#  ["Towels and Napkins 4", "Jones", "Malathi Raj", "malathi@drylogics.com", "2024-02-22"],
#  ["Jones Spring Collection 2024", "Jones", "Keerthana Karthi", "keerthana@drylogics.com", "2024-02-01"],
#  ["Kims Sprint Collection 2024", "Kimberly", "Rajesh Khanna", "rajesh@drylogics.com", "2024-01-02"],
#  ["Rainer Collection 2023", "Rainer", "Sasirekha Ponnusami", "sasirekha@drylogics.com", "2023-12-14"],
#  ["Jones December 2023", "Jones", "Guru Pradeep", "guru@drylogics.com", "2023-12-10"],
#  ["Jones Kids Collection 2023", "Jones", "Malathi Raj", "malathi@drylogics.com", "2023-12-10"],
#  ["Rainer Christmas 2023", "Rainer", "Keerthana Karthi", "keerthana@drylogics.com", "2023-12-03"],
#  ["Sharon's Winter Collection 2023", "Sharon", "Rajesh Khanna", "rajesh@drylogics.com", "2023-11-30"],
#  ["Sharon Winter Collection 2023", "Sharon", "Sasirekha Ponnusami", "sasirekha@drylogics.com", "2023-11-20"],
#  ["Kim's Winter Collection 2023", "Kimberly", "Rajesh Khanna", "rajesh@drylogics.com", "2023-11-15"],
#  ["Jones Winter Collection 2023", "Jones", "Keerthana Karthi", "keerthana@drylogics.com", "2023-11-10"]]

# 7) Find all Assignees who are responsible for orders for USA

def assignees_responsible_for_usa_orders(orders, buyers, users)
  orders.reduce([]) do |assignee_name, order| # merge users and buyers data
    buyer_data = buyers.find { |buyer| buyer[:name] == order[:buyer] }
    user_data = users.find { |user| user[:id] == order[:assignee] }
    buyer_data[:country] == 'USA' && assignee_name << user_data[:name]
    assignee_name.uniq
  end
end
puts "7.Assignees_responsible_for_USA_orders: \n #{assignees_responsible_for_usa_orders(orders, buyers,
                                                                                        users).join("\n")}"

# output:

# Keerthana Karthi
# Sasirekha Ponnusami
# Malathi Raj
# Guru Pradeep

# 8) List the number of orders grouped by country name

def number_of_orders_by_country(orders, buyers)
  orders_data = orders.each_with_object([]) do |order, result| # merge buyers data
    buyer_data = buyers.find { |buyer| buyer[:name] == order[:buyer] }
    result << { country_name: buyer_data[:country], currency: buyer_data[:currency] }
  end
  orders_data.each_with_object(Hash.new(0)) do |order, orders_counts|
    orders_counts[order[:country_name]] += 1 # order counts by country
  end
end
puts "8.Number of orders by country \n #{number_of_orders_by_country(orders, buyers)}"

# output:
# {"USA"=>8, "UK"=>2, "France"=>2}

# 9) Show all orders for which payment is in GBP

def orders_payment_is_in_gbp(orders, buyers)
  buyer_data = buyers.each_with_object([]) do |buyer, result|
    buyer[:currency] == 'GBP' && result << { name: buyer[:name] }
  end
  buyer_data.reduce([]) do |_selected, buyer|
    orders.each_with_object([]) do |order, output|
      output << order if order[:buyer] == buyer[:name]
    end
  end
end
puts "9.Orders_payment_is_in_GBP \n #{orders_payment_is_in_gbp(orders, buyers).join("\n")}"

# output:

# {:id=>5, :buyer=>"Sharon", :name=>"Sharon's Winter Collection 2023", :assignee=>4, :delivery_date=>"2023-11-30", :country_name=>"UK", :currency=>"GBP"}
# {:id=>11, :buyer=>"Sharon", :name=>"Sharon Winter Collection 2023", :assignee=>10, :delivery_date=>"2023-11-20", :country_name=>"UK", :currency=>"GBP"}

# 10) Create the following table
# Column 1: Assignee Name
# Column 2: number of orders
# Column 3: the countries to which orders are for in comma separated values. eg: (Rajesh Khanna\t3\tUK,France)

def create_table(orders, users, buyers)
  users.each_with_object([]) do |user, result|
    assigned_orders = orders.each_with_object([]) do |order, selected|
      selected << order if order[:assignee] == user[:id]
    end
    count = assigned_orders.count
    countries_data = assigned_orders.each_with_object([]) do |order, countries|
      buyer_data = buyers.find { |buyer| buyer[:name] == order[:buyer] }
      countries << buyer_data[:country]
    end
    result << [user[:name], count, countries_data.uniq.join(',')]
  end
end
puts "10.Table: \n #{create_table(orders, users, buyers)}"
