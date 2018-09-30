require_relative( '../db/sql_runner' )

class Transaction

  attr_accessor :tag_id, :merchant_id, :transaction_amount, :transaction_date
  attr_reader :id

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

  def merchant()
    sql = "SELECT * FROM merchants WHERE merchant_id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first)
  end

  def tag()
    sql = "SELECT * FROM tags WHERE tag_id = $1"
    values = [@tag_id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first)
  end

  def self.transactions_by_tag(tag_id)
    sql = "SELECT * FROM transactions WHERE tag_id = $1;"
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

  def total_amount_spent_by_tag()
    transactions = Transaction.transactions_by_tag(@tag_id)
    total = 0
    for transaction in transactions
      total += transaction.transaction_amount
    end
    return total
  end

  def self.total_amount_spent
    total = 0
    transactions = Transaction.all
    for transaction in transactions
      total += transaction.transaction_amount
    end
    return total
  end

  def update
    sql = "UPDATE transactions
    SET (tag_id, merchant_id, transaction_amount, transaction_date) =
    ($1, $2, $3, $4
      ) WHERE id = $5"
      values = [@tag_id, @merchant_id, @transaction_amount, @id]
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM transactions WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM transactions"
      results = SqlRunner.run(sql)
      return results.map {|transaction| Transaction.new(transaction)}
    end

    def self.delete_all()
      sql = "DELETE FROM transactions;"
      SqlRunner.run(sql)
    end

    def self.find(id)
      sql = "SELECT * FROM transactions
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql,values)
      return Transaction.new(results.first)
    end




  end
