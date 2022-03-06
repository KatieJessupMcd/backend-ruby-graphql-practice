module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_item, String, mutation: Mutations::CreateItem
    field :create_artist, String, mutation: Mutations::CreateArtist
    field :update_artist, String, mutation: Mutations::UpdateArtist
    field :delete_artist, String, mutation: Mutations::DeleteArtist
  end
end
