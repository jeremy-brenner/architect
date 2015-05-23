module Architect
  class SchemaColumn < Architect::SchemaModel


    column :name, :string
    column :database, :string
    column :table, :string
    column :precision, :string
    column :limit, :string
    column :sql_type, :string
    
    def self.all(table)
      ActiveRecord::Base.connection.columns(table).map do |field|
        Architect::SchemaColumn.new(name:field.name,database:current_database,table:table,sql_type:field.sql_type,precision:field.precision,limit:field.limit)
      end
    end

  end
end