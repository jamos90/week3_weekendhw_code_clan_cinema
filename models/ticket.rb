class Ticket

  attr_accessor :name, :funds
  attr_reader :id

  def initialize (options)
    @id = options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']

  end

  def save()
    sql = "INSERT INTO tickets
    (customer_id,
      film_id
      )
      VALUES (
        $1, $2
        )
        RETURNING id"
    values = [@customer_id, @film_id]
    tickets = SqlRunner.run(sql,values).first()
    @id = tickets['id'].to_i()
  end



  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

  def self.delete()
    sql = "DELETE FROM tickets"
    deleted_tickets = SqlRunner.run(sql)
  end



end
