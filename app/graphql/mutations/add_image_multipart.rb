module Mutations
  class AddImageMultipart < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :image_file, ApolloUploadServer::Upload, required: true
    field :image, Types::ImageType, null: true
    field :errors, [String], null: true
    def resolve(input)
      file = input[:image_file]
      blob = ActiveStorage::Blob.create_and_upload!(
        io: file,
        filename: file.original_filename,
        content_type: file.content_type
      )

      image = image.new(
        title: input[:title],
        description: input[:description],
        image: blob
      )

      if image.save
        { image: image }
      else
        { errors: image.errors }
      end
    end
  end
end

