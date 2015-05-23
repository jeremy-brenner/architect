module Architect
  class SchemaModel < ActiveRecord::Base
    def self.columns() @columns ||= []; end

    def self.column(name, sql_type = nil, default = nil, null = true)
      type = "ActiveRecord::Type::#{sql_type.to_s.camelize}".constantize.new
      columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, type, null)
    end
      
    def self.all
    end

    def self.current_database
      ActiveRecord::Base.connection.try(:current_database) || 'database'
    end

  end
end