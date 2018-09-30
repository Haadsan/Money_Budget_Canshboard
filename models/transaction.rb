require_relative( '../db/sql_runner' )

class Transaction


  attr_reader(:id, :tag_id, :merchant_id, :transaction_amount, :transaction_date)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @tag_id = options['tag_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @transaction_amount = options['transaction_amount'].to_i
    @transaction_date = options['transaction_date']
  end


  def save()
    sql = "INSERT INTO transactions
    (
      tag_id,
      merchant_id,
      transaction_amount,
      transaction_date
    )
    VALUES(

      $1, $2, $3, $4

    )
    RETURNING id"
    values = [@tag_id, @merchant_id, @transaction_amount, @transaction_date]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end
  
  def update
    sql = "UPDATE transactions
    SET (tag_id, merchant_id, transaction_amount, transaction_date) =
    ($1, $2, $3, $4
      ) WHERE id = $5"
      values = [@tag_id, @merchant_id, @transaction_amount, @id]
      SqlRunner.run(sql)
    end
  end
