require_relative("../db/sql_runner.rb")

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
