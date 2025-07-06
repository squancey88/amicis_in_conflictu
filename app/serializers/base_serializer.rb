class BaseSerializer
  def initialize(object, options = {})
    @object = object
    @options = options
  end

  def serialize
    if @object.respond_to?(:each)
      @object.map { |item| serialize_single(item) }
    else
      serialize_single(@object)
    end
  end

  private

  attr_reader :object, :options

  def serialize_single(item)
    raise NotImplementedError, "Subclasses must implement serialize_single"
  end

  def include_attribute?(key)
    return true unless options[:only] || options[:except]

    if options[:only]
      Array(options[:only]).include?(key)
    elsif options[:except]
      !Array(options[:except]).include?(key)
    else
      true
    end
  end

  # Helper for nested serialization
  def serialize_association(association, serializer_class, opts = {})
    return nil if association.nil?

    serializer_class.new(association, opts).serialize
  end
end
