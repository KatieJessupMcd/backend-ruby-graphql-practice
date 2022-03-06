class Mutations::UpdateArtist < Mutations::BaseMutation

  argument :id, ID, required: true
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :email, String, required: false

  field :errors, [String], null: false
  field :success, Boolean, null: false
  field :artist, Types::ArtistType, null: true
  

  def resolve(id:, **args)
    artist = Artist.find(id);
    if artist.update(args) 
      {success: true, artist: artist, errors: []}
    else 
      {success: true, artist: nil, errors: artist.errors.full_messages}
    end
    rescue ActiveRecord::RecordNotFound
      return { success: false, book: nil, errors: ['record-not-found'] }
    end
end