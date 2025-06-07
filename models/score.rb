require 'sequel'
require 'dotenv/load'

db = Sequel.connect(ENV['DATABASE_URL'])

class Score < Sequel::Model(:scores); end 

db.create_table? :scores do
  primary_key :id
  String :name
  Integer :score
  String :difficulty
  DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
end

unless db.table_exists?(:scores)
  db.create_table :scores do
    primary_key :id
    String :name
    Integer :score
    String :difficulty
    DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
  end
end
