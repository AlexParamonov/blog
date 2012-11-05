class Naming
  def initialize(object)
    @object = object
  end

  def module_name
    parts = object.class.name.split("::")
    parts.size > 1 ? parts[0...-1].join('::') : nil
  end

  private
  attr_reader :object
end
