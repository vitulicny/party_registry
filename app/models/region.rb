# Třída Region reprezentuje Krajské sdružení
class Region < Organization
  # Krajské sdružení je zařazeno do republikové struktury
  belongs_to :country, :foreign_key => "parent_id"

  # Krajské sdružení má předsednictvo
  has_one :board, :class_name => Body, :foreign_key => "organization_id"

  # Krajské předsednictvo zřizuje a eviduje krajské pobočky
  has_many :branches, :foreign_key => "parent_id"

  # Krajské sdružení má kmenové členy a příznivce
  has_many :domestic_people, class_name: "Person", foreign_key: "domestic_region_id"

  # Krajské sdružení má hostující členy a příznivce
  has_many :guest_people, class_name: "Person", foreign_key: "guest_region_id"

  # Krajské sdružení má kmenové a hostující členy a příznivce
  def people
  	domestic_people+guest_people
  end

  # Krajské sdružení má adresy (sídla, poštovní)
  has_many :addresses,  :as => :addressable, :dependent => :destroy

end
