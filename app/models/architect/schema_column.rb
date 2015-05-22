module Architect
  class SchemaColumn < Architect::SchemaModel


    column :name, :string
    column :database, :string
    column :table, :string
    column :precision, :string
    column :limit, :string

     #columns: ActiveRecord::Base.connection.columns(table),
     #         indexes: ActiveRecord::Base.connection.indexes(table),
     #         primary_key: ActiveRecord::Base.connection.primary_key(table),
     #         foreign_keys: ActiveRecord::Base.connection.foreign_keys(table)
     def self.all(table)
        db = ActiveRecord::Base.connection.current_database
        ActiveRecord::Base.connection.columns(table).map do |field|
          Architect::SchemaColumn.new(name:field.name,database:db,table:table,precision:field.precision,limit:field.limit)
        end
     end

  end
end