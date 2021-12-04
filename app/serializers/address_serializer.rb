# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string
#  city       :string
#  contact_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AddressSerializer < ActiveModel::Serializer
  attributes :id, :city, :street

  belongs_to :contact do
    link(:related) {
      contact_address_path(object.contact.id)
    }
  end
end
