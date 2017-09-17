module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  def valid?
    validate!
  rescue
    false
  end
end
