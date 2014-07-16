def add_user(email, password)
  query = <<-QUERY
    INSERT INTO users (email, password)
    VALUES ('#{email}', '#{password}')
  QUERY

  @database_connection.sql(query)
end

def get_emails
  query = <<-QUERY
    SELECT email FROM users
  QUERY

  @database_connection.sql(query)
end