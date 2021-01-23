module Mutations
  class AddImageBase64 < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :data, String, required: true
    field :event, Types::EventType, null: true
    field :errors, [String], null: true
    def resolve(input)
      file = input[:data]
      blob = ActiveStorage::Blob.create_and_upload!(
        io: file,
        filename: file.original_filename,
        content_type: file.content_type
      )

      image = Image.new(
        title: input[:title],
        description: input[:description],
        image: blob
      )

      if event.save
        { event: event }
      else
        { errors: event.errors.full_messages }
      end
    end
  end
end


