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

  def update ()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "UPDATE property_tracker
      SET
      (
        address,
        value,
        num_of_bedrooms,
        year_built
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@address, @value, @num_of_bedrooms, @year_built, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close
  end

  def delete()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM property_tracker WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()

  end

  def find()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT value FROM property_tracker WHERE id = $1"
    values = [@id]
    db.prepare("find", sql)
    db.exec_prepared("find", values)
    db.close()
  end

  def find_by_address()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT value FROM property_tracker WHERE address = $1"
    values = [@address]
    db.prepare("find_address", sql)
    db.exec_prepared("find_address", values)
    db.close()
  end

end
