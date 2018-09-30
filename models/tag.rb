require_relative( '../db/sql_runner' )

class Tag

  attr_reader(:id, :category_tag)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @category_tag= options['category_tag']
  end

  def save()
    sql = "INSERT INTO tags
    (
      category_tag
    )
    VALUES(
      
      $1

    )
    RETURNING id"
    values = [@category_tag]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE tags
    SET (category_tag) = ($1) WHERE id = $2"
    values = [@category_tag, @id]
    SqlRunner.run(sql)
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
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values)
    return Transaction.new(results.first)

  end

  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    results = Sqlrunner.run(sql,values)
    return Tag.new(results.first)
  end


end
