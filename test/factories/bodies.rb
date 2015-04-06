# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :body do
    factory :presidium
    factory :country_bodies do
      factory :rk do
        name "Rozhodčí komise"
        acronym "RK"        
      end
      organization { Country.first || create(:country) }
    end
  end
end
