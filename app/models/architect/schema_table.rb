module Architect
  class SchemaTable < Architect::SchemaModel

    column :name, :string
    column :database, :string

    def schema_columns
      Architect::SchemaColumn.all(name)
    end

    def self.all
      db = ActiveRecord::Base.connection.current_database
      ActiveRecord::Base.connection.tables.map do |table|
        Architect::SchemaTable.new(name:table,database:db)
      end
    end
  end
end


    #column :article_id, :integer
    #column :message, :text

     #columns: ActiveRecord::Base.connection.columns(table),
     #         indexes: ActiveRecord::Base.connection.indexes(table),
     #         primary_key: ActiveRecord::Base.connection.primary_key(table),
     #         foreign_keys: ActiveRecord::Base.connection.foreign_keys(table)
