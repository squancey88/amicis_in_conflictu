module TextLinkable
  extend ActiveSupport::Concern

  included do
    def link_name
      raise NotImplementedError
    end

    def link_path
      raise NotImplementedError
    end

    def link_description
      ""
    end

    def as_link
      {
        id:,
        href: link_path,
        name: link_name,
        description: link_description,
        crossReference: "linked",
        model: model_name.name
      }
    end
  end

  class_methods do
    def register_link_search_fields(*fields)
      @fields ||= fields
    end

    def text_editor_link_search(query_param)
      text_editor_link_search_query(query_param).map { _1.as_link }
    end

    def text_editor_link_search_query(query_param)
      query = where("#{@fields.first} ILIKE ?", "%#{sanitize_sql_like(query_param)}%")
      @fields[1..].each do |field|
        query = query.or(where("#{field} ILIKE ?", "%#{sanitize_sql_like(query_param)}%"))
      end
      query
    end
  end
end
