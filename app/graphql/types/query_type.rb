module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :images,
          [Types::ImageType],
          null: false,
          description: "Returns a list of images"
    def images
      Image.all.with_attached_image_file
    end
  end
end
