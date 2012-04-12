# The database should have been set up using the database migrations in
# the dbMigration directory. 
require 'rubygems'
require 'ramaze'
require 'sequel'

# Open the library's database. This must be done before we access the models
# that use it.
Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://library.sqlite')

#
# This is the model for the authors and is backed by the :authors table in the
# database. 
#
# Create the Author model. 
class Author < Sequel::Model 
    many_to_many :books
end

#
# This is the model for the book and is backed by the :book table in the
# database. 
#
# Create the Book model. 
class Book < Sequel::Model 
    many_to_many :authors
end