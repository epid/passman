class Entry < Sequel::Model

  # Validations
  def validate
    errors[:title] << "must be specified" if title.nil?
  end

  # Hooks
  def before_create
    self.created_at = Time.now
    self.updated_at = Time.now
  end

  def before_update
    self.updated_at = Time.now
  end

  self.plugin(:schema)
  unless table_exists?
    set_schema do
      primary_key :id
      String      :title
      String      :username
      String      :password
      Text        :notes
      DateTime    :created_at
      DateTime    :updated_at
    end
    create_table
    insert( :title => 'Test Entry',
            :username => 'test_user',
            :password => 'test_password',
            :notes => 'Here is a test note.',
            :created_at => Time.now,
            :updated_at => Time.now
    )
  end
end
