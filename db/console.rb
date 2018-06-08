require('pry')
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")
require_relative("sql_runner.rb")



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


  binding.pry
  nil
