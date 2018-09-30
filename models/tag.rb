require_relative( '../db/sql_runner' )

class Tag

  attr_reader(:id, :tag_name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @tag_name= options['tag_name']
  end

end
