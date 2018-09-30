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


end
