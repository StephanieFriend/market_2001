class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def total_inventory
    hash = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |key, value|
        if hash.include?(key)
          vendor.stock(key, value)
          hash[key] = {:quantity => vendor.check_stock(key), :vendors => vendors_that_sell(key)}
        else
          hash[key] = {:quantity => vendor.check_stock(key), :vendors => vendors_that_sell(key)}
        end
      end
    end
    hash
  end

  def overstocked_items
  end
end