require('pry-byebug')
require_relative('./models/property_details.rb')

property1 = Property.new({
  'address' => 'Castle Terrace',
  'value' => 1000,
  'num_of_bedrooms' => 5,
  'year_built' => 1880
  })

  property2 = Property.new({
    'address' => 'Hanover Street',
    'value' => 2000,
    'num_of_bedrooms' => 7,
    'year_built' => 1900
    })


  binding.pry


  nil  
