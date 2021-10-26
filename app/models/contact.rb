class Contact < ApplicationRecord

  # Associations
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address

  # def birthdate_br
  #   I18n.locale(self.birthdate) unless self.birthdate
  # end

  #posso colocar como opcional usando o optional: true

  # def author
  #   "Davi Alessandro"
  # end

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end
end
