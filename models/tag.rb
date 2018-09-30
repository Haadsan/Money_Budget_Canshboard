require_relative( '../db/sql_runner' )

class Tag

  attr_reader(:id, :category)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @category= options['category']
  end

  def save()
    sql = "INSERT INTO tags
    (
      category
    )
    VALUES(

      $1

    )
    RETURNING id"
    values = [@category]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE tags
    SET (category) = ($1) WHERE id = $2"
    values = [@category, @id]
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end
end
