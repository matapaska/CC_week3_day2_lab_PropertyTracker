require('pg')

class Property

attr_accessor :address, :value, :num_of_bedrooms, :year_built
attr_reader :id

  def initialize(options)
    @address = options['address']
    @value = options['value']
    @num_of_bedrooms = options['num_of_bedrooms']
    @year_built = options['year_built']
    @id = options['id'].to_i if options['id']
  end

  def save()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "INSERT INTO property_tracker
    (
     address,
     value,
     num_of_bedrooms,
     year_built
    ) VALUES
    ($1, $2, $3, $4)
      RETURNING *;"
      values = [@address, @value, @num_of_bedrooms, @year_built]
      db.prepare("save", sql)
      result = db.exec_prepared("save", values)
      @id = result[0]['id'].to_i
      db.close()
    end

end
