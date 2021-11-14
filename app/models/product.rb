class Product < ApplicationRecord
end

a = Product.select(
  "id",
  "(SELECT COUNT(quantity) FROM products) as sum",
  "(SELECT MAX(quantity) FROM products) as max",
  "(SELECT AVG(quantity) FROM products) as avg",
).first


a = Product.select(
  "id",
  "(SELECT COUNT(quantity) FROM products) as sum",
  "(SELECT MAX(quantity) FROM products) as max",
  "(SELECT AVG(quantity) FROM products) as avg",
).first

sql = "WITH cte_table AS (
  SELECT COUNT(quantity) AS sum, MAX(quantity) AS max, AVG(quantity) AS avg FROM products
)
SELECT COUNT(products.quantity),
  cte_table.sum,
  cte_table.max,
  cte_table.avg
FROM products
INNER JOIN cte_table
ON 1 = 1"

r = ActiveRecord::Base.connection.execute(sql)


cte = Product.select(
  "COUNT(quantity) as sum",
  "MAX(quantity) as max",
  "AVG(quantity) as avg"
)

Product.select('cte.sum, cte.max, cte.avg').with(cte: cte).joins("JOIN cte ON 1 = 1").first
