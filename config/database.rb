
# Connection.new takes host, port
host = 'localhost'
port = Mongo::Connection::DEFAULT_PORT

database_name = case Padrino.env
  when :development then 'sy_fy_home_development'
  when :production  then 'sy_fy_home_production'
  when :test        then 'sy_fy_home_test'
end

Mongoid.database = Mongo::Connection.new(host, port).db(database_name)

