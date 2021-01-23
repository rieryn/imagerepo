module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
  class MutationType < Types::BaseObject
    field :add_image_multipart, mutation: Mutations::AddImageMultipart
  end
end
