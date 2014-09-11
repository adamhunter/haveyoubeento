class Resource

  attr_accessor :data

  def self.search(query)
    Class.new(self.const_get(:Collection)).new(request(query), self)
  end

  def self.request(query)
    raise NotImplementedError
  end

  def self.attribute(name)
    parsers[name.to_sym] = nil
    attr_accessor name
  end

  def self.attributes
    parsers.keys
  end

  def self.parse(name, parser)
    parsers[name.to_sym] = parser
  end

  def self.parsers
    @parsers ||= {}
  end

  def initialize(payload)
    self.data = payload
    self.class.parsers.each { |name, parser| send "#{name}=", instance_exec(&parser) }
  end

  def data=(value)
    @data = value.with_indifferent_access
  end

  def as_json(*)
    self.class.attributes.inject({}) { |acc, attr| acc.tap { |hash| hash[attr] = send(attr) } }
  end

  class Collection
    include Enumerable
    attr_reader :members
    delegate :each, to: :members
    def initialize(data, resource)
      @members = data.map { |datum| resource.new(datum) }
    end
  end

end
