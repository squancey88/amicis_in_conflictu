module TextContentGenerator
  def generate_text_section(blocks: [generate_paragraph_block])
    {
      time: DateTime.now.to_i,
      version: "2.29.1",
      blocks:
    }
  end

  def generate_paragraph_block(text: Faker::Lorem.paragraph)
    as_block("paragraph", {text:})
  end

  def generate_header_block(text: Faker::Lorem.words(3).join(" "), level: 1)
    as_block("header", {text:, level:})
  end

  def generate_unordered_list_block(items: Array.new(5) { generate_list_item(content: Faker::Lorem.sentence) })
    as_block("list", {
      meta: {},
      style: "unordered",
      items:
    })
  end

  def generate_ordered_list_block(items: Array.new(5) { generate_list_item(content: Faker::Lorem.sentence) })
    as_block("list", {
      meta: {counterType: "numeric"},
      style: "ordered",
      items:
    })
  end

  def generate_list_item(content:, meta: {}, items: [])
    {content:, meta:, items:}
  end

  private

  def as_block(type, data)
    {
      id: SecureRandom.alphanumeric(10),
      data:,
      type:
    }
  end
end
