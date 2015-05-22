module Architect
  class TablesController < Architect::ApplicationController
    def index
      @schema_tables = schema_tables
    end

    private 
    def schema_tables
      Architect::SchemaTable.all
    end
  end
end