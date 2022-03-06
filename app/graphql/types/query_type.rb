  module Types
    class QueryType < Types::BaseObject
      include GraphQL::Types::Relay::HasNodeField
      include GraphQL::Types::Relay::HasNodesField
  
      # /items
      field :items, 
      [Types::ItemType],
      null: false, 
      description: "Return a list of items"
  
      def items
        Item.all
      end 

      # /item/:id

      field :item, Types::ItemType, null: false, description: "Returns an item" do
        argument :id, ID, required: true
      end 

      def item(id:)
        Item.find(id)
      end

      # /artists
      field :artists, 
      [Types::ArtistType], 
      null: false, 
      description: "Return a list of artists"

      def artists
        Artist.all
      end
    end
  end
