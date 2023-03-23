# frozen_string_literal: true

class AppSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # For batch-loading (see https://graphql-ruby.org/dataloader/overview.html)
  use GraphQL::Dataloader

  # GraphQL-Ruby calls this when something goes wrong while running a query:

  # Union and Interface Resolution
  def self.resolve_type(_abstract_type, _obj, _ctx)
    # TODO: Implement this method
    # to return the correct GraphQL object type for `obj`
    raise(GraphQL::RequiredImplementationMissingError)
  end

  # Stop validating when it encounters this many errors:
  validate_max_errors(100)

  # Relay-style Object Identification:

  # Return a string UUID for `object`
  def self.id_from_object(object, _type_definition, _query_ctx)
    "#{object.class.name}_#{object.id}"
  end

  # Given a string UUID, find the object
  def self.object_from_id(global_id, _query_ctx)
    raise ActiveRecord::RecordNotFound if global_id.blank?

    class_name, id = global_id.split('_')
    raise ActiveRecord::RecordNotFound if class_name.blank? || id.blank?

    Object.const_get(class_name).find(id)
  end
end
