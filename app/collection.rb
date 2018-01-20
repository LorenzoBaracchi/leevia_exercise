class Collection < SimpleDelegator

  def initialize collection
    super
  end

  def group attribute
    grouped = self.group_by {|city| city.send(attribute)}
    grouped.each{|k,v| grouped[k] = Collection.new(v)}
    grouped
  end
end
