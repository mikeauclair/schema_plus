module SchemaPlusDbDefault
  module ActiveRecord
    module Attribute
      def self.included(base)
        base.alias_method_chain :original_value, :schema_plus_db_default
      end

      def original_value_with_schema_plus_db_default
        # prevent attempts to cast DB_DEFAULT to the attributes type.
        # We want to keep it as DB_DEFAULT so that we can handle it when
        # generating the sql.
        return DB_DEFAULT if value_before_type_cast.equal? DB_DEFAULT
        original_value_without_schema_plus_db_default
      end

    end
  end
end

