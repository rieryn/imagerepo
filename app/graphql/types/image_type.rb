module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :base64data, String, null: true
    field :image_url, String, null: true
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def image_url
      if object.image_file.present?
        rails_blob_path(object.image_file, only_path: true)
      end
    end
  end
end
