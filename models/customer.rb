require_relative("../db/sql_runner.rb")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @name = options['name']
    @id = options['id']
    @funds = options['funds']
  end


  def save()
    sql = "INSERT INTO customers
    (name,
    funds
      )
      VALUES
      ($1, $2)
      RETURNING id"
      values = [@name, @funds]
      customer = SqlRunner.run(sql, values).first()
      @id = customer['id'].to_i()
    end

  def update()
    sql = "UPDATE customers SET name = $1, funds =$2 WHERE id = $3"
    values = [@name, @funds, @id]
    updated_customers = SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map{|film| Film.new(film)}
  end

  def how_many_tickets()
    sql = "SELECT * FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values).count()
    # results = tickets.map {|ticket| Customer.new(ticket)}
    # return results.length()
    return tickets
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values =[]
    customers = SqlRunner.run(sql, values)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

  def self.delete()
    sql = "DELETE FROM customers"
    deleted_customers = SqlRunner.run(sql)
  end



end
