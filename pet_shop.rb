def pet_shop_name(pet_shop)
  pet_shop[:name]
end

def total_cash(pet_shop)
  pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, sum)
  pet_shop[:admin][:total_cash] += sum
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
  pet_shop[:admin][:pets_sold] += sold
end

def stock_count(pet_shop)
  pets = 0
  pet_shop[:pets].each do |pet|
    pets += 1
  end
  pets
end

def pets_by_breed(pet_shop, breed)
  breeds = []
  pet_shop[:pets].each do |pet|
    breeds << breed if breed == pet[:breed]
  end
  breeds
end

def find_pet_by_name(pet_shop, name)
  pet_shop[:pets].detect.each do |pet|
    # I believe detect returns nil if it can't find the named pet; however, this seems to clash with the requirement to put 'return nil unless pet' in the optional excerise
    pet if pet[:name] == name
  end
end

def remove_pet_by_name(pet_shop, name)
  pet_shop[:pets].each do |pet|
    pet.shift if name == pet[:name]
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

# OPTIONAL

def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price] ? true : false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  return nil unless pet
  # I THINK what this does is return nil unless 'pet' returns some value, regardless of what that value is
  return nil unless customer_can_afford_pet(customer, pet)
  add_or_remove_cash(pet_shop, pet[:price])
  remove_customer_cash(customer, pet[:price])
  increase_pets_sold(pet_shop, 1)
  add_pet_to_customer(customer, pet)
  remove_pet_by_name(pet_shop, pet)
end
