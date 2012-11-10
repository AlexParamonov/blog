class Naming
  def initialize(object)
    @object = object
  end

  def module_name
    namespace.join('::')
  end

  def namespace
    object.class.name.split("::")[0...-1]
  end

  def tokens
    namespace.map { |part| part.downcase.to_sym }
  end

  private
  attr_reader :object
end
