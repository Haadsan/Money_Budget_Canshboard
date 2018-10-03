require_relative( '../db/sql_runner' )

class Tag

  attr_accessor :category_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @category_name = options['category_name']
  end

  def save()
    sql = "INSERT INTO tags
    (
      category_name
    )
    VALUES (

      $1

    )
    RETURNING id"
    values = [@category_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


  def update
    sql = "UPDATE tags
    SET category_name = $1 WHERE id = $2"
    values = [@category_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run(sql)
    return results.map {|tag| Tag.new(tag)}
  end

  def self.delete_all()
    sql = "DELETE FROM tags;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values)
    return Tag.new(results.first)
  end

end
