require('pry')
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")
require_relative("sql_runner.rb")

Customer.delete()
Film.delete()

 customer1 = Customer.new({
   'name' => 'James',
   'funds' => 50
   })

   customer1.save()

   customer2 = Customer.new({
     'name' => 'Jess',
     'funds' => 60
     })

     customer2.save()

  film1 = Film.new({
    'title' => 'Solo',
    'price' => 13
    })

  film1.save()

  film2 = Film.new({
    'title' => 'Infinity War',
    'price' => 20
    })

    film2.save()

    ticket1 = Ticket.new({
      'customer_id' => customer1.id,
      'film_id' => film1.id
      })

      ticket1.save()

    ticket2 = Ticket.new({
      'customer_id' => customer2.id,
      'film_id' => film2.id
      })

    ticket2.save()



  binding.pry
  nil
