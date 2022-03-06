class Mutations::DeleteArtist < Mutations::BaseMutation

  argument :id, ID, required: true

  field :id, ID, null: true
  

  def resolve(id:)
    artist = Artist.find(id);
    artist.destroy
    {id: id}
    rescue ActiveRecord::RecordNotFound
      return { success: false, book: nil, errors: ['record-not-found'] }
    end

end