module Architect
  class SchemaTable < Architect::SchemaModel
    after_initialize :load_model

    column :name, :string
    column :database, :string

    def schema_columns
      Architect::SchemaColumn.all(name)
    end

    def model_exists?
      not @model.nil?
    end

    def join_data
      return [] unless model_exists?
      @model._reflections.values.map do |ref|
        jk = ref.join_keys(ref.name.to_s.classify.constantize)
        {
          'local' => {
            'table' => name,
            'field' => jk['foreign_key']
          },
          'remote' => {
            'table' => ref.plural_name.to_s,
            'field' => jk['key']
          }
        }
      end
    end

    def load_model
      begin
        @model ||= name.classify.constantize
      rescue
        @model = nil
      end
    end

    def self.all
      ActiveRecord::Base.connection.tables.map do |table|
        Architect::SchemaTable.new(name:table,database:current_database)
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
