class Collection < SimpleDelegator

  def initialize collection
    super
  end

  def group attribute
    grouped = self.group_by {|city| city.send(attribute)}
  end
end
