class XmlDocument
  # TODO: your code goes here!
  attr_reader :tab_count

  def initialize(indent = false)
    @indent = indent
    @tab_count = 0
  end

  def method_missing(tag_name, *args, &blk)
    attributes = args.first || {}
    create_tag(tag_name, attributes, &blk)
  end

  def create_tag(name, attributes, &blk)
    xml = ""
    if block_given?
      # tab_count.times do {xml << insert_tab}
      xml << "#{open_tag(name, attributes)}"
      xml << "#{blk.call}"
      xml << "#{close_tag(name)}"
    else
      xml << self_closing_tag(name, attributes)
    end
    xml
  end

  def open_tag(name, attributes)
    return "<#{name} #{get_attributes(attributes)}>" if !attributes.empty?
    "<#{name}>"
  end

  def self_closing_tag(name, attributes)
    return "<#{name} #{get_attributes(attributes)}/>" if !attributes.empty?
    "<#{name}/>"
  end

  def close_tag(name)
    "</#{name}>"
  end

  def get_attributes(attributes)
    attrs = []
    attributes.each { |key, val| attrs << "#{key}=\"#{val}\""}
    attrs.join(" ")
  end

  def insert_tab
    "  "
  end

end
