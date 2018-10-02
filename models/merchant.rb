require_relative( '../db/sql_runner' )

class Merchant

  attr_accessor :merchant_name
  attr_reader :id


  def initialize(options)

    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']

  end


  def save()
    sql = "INSERT INTO merchants
    (
      merchant_name
    )
    VALUES(

      $1

    )
    RETURNING id"
    values = [@merchant_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE merchants
    SET merchant_name = ($1) WHERE id = $2"
    values = [@merchant_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run(sql)
    return results.map {|merchant| Merchant.new(merchant)}
  end

  def self.delete_all()
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values)
    return Merchant.new(results.first)
  end

  def self.find_merchant_name(id)
      sql = "SELECT merchant_name FROM tags WHERE id = $1;"
      values = [id]
      return SqlRunner.run(sql, values).first
    end

end
