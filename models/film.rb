require_relative("../db/sql_runner.rb")
require_relative("./customer.rb")

class Film
  attr_reader :id
  attr_accessor :price, :title

  def initialize( options )
   @title= options['title']
   @id = options['id']
   @price = options['price']
  end

  def save()
    sql ="INSERT INTO films(
    title,
    price)
    VALUES(
      $1, $2
      )
    RETURNING id"
    values = [@title, @price]
    films = SqlRunner.run(sql, values).first()
    @id = films['id'].to_i()
  end

  def update()
    sql = "UPDATE films SET title = $1, price = $2 WHERE id = $3"
    values = [@title, @price, @id]
    film_update = SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE film_id = $1"
    values =[@id]
    customers = SqlRunner.run(sql, values)
    return customers.map{|customer| Customer.new(customer)}
  end

  def how_many_customers
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE film_id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values).count()
    # customers = results.map{|customer| Customer.new(customer)}
    # return customers.length()
    return results
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map {|film| Film.new(film)}
  end

  def self.delete()
    sql = "DELETE FROM films"
    deleted_films = SqlRunner.run(sql)
  end

end
