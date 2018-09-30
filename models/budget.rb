require_relative( '../db/sql_runner' )

class Budget

  attr_accessor :budget_amount
  attr_reader :id


  def initialize(options)

    @id = options['id'].to_i if options['id']
    @budget_amount = options['budget_amount']

  end

  def save()
    sql = "INSERT INTO budgets
    (
      budget_amount
    )
    VALUES(

      $1

    )
    RETURNING id"
    values = [@budget_amount]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM budgets"
    results = SqlRunner.run(sql)
    return results.map {|budget| Budget.new(budget)}
  end

  def update
    sql = "UPDATE budgets
    SET (budget_amount) = ($1) WHERE id = $2"
    values = [@budget_amount, @id]
    SqlRunner.run(sql)
  end
end
