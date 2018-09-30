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


end
