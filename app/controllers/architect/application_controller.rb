module Architect
  class ApplicationController < ActionController::Base
    def index
    end

    private

    def schema 
      Hash[
        ActiveRecord::Base.connection.tables.map do |table|
          [ table, 
            {
              columns: ActiveRecord::Base.connection.columns(table),
              indexes: ActiveRecord::Base.connection.indexes(table),
              primary_key: ActiveRecord::Base.connection.primary_key(table),
              foreign_keys: ActiveRecord::Base.connection.foreign_keys(table)
            }
          ]
        end
      ]
    end
  end
end
