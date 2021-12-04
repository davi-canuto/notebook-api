# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string
#  contact_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number

  belongs_to :contact do
    link(:related) {
      contact_phones_path(object.contact.id)
    }
  end
end
