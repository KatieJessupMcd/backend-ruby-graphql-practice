class Mutations::CreateItem < Mutations::BaseMutation

  argument :title, String, required: true
  argument :description, String, required: true

  field :item, Types::ItemType, null: false
  field :errors, [String], null: false

  def resolve(title:, description:)
    item = Item.new(title: title, description: description)
    if item.save 
      {item: item, errors: []}
    else 
      {item: nil, errors: item.errors.full_messages}
    end
  end
end