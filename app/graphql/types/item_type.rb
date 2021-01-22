module Types
  class ItemType < Types::BaseObject
    # ...
    field :user, Types::UserType, null: false
  end
end
