# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  birthdate  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kind_id    :integer
#
class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) {
      contact_kind_path(object.id)
    }
  end
  has_many :phones do
    link(:related) {
      contact_phones_path(object.id)
    }
  end

  has_one :address do
    link(:related) {
      contact_address_path(object.id)
    }
  end

  # link(:self) {
  #   contact_path(object.id)
  # }

  # link(:kind){
  #   kind_path(object.kind.id)
  # }
end
