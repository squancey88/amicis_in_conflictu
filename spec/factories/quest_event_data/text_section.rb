FactoryBot.define do
  factory :quest_event_data_text_section, class: "QuestEventData::TextSection" do
    data {
      {
        title: "Test",
        content: {
          time: 1714678203542,
          blocks: [
            {id: "Wk4L5wcZCZ", type: "paragraph", data: {text: "Something something dark side"}},
            {id: "Wk4L5wcZCZ", type: "header", data: {text: "Hello world", level: "1"}}
          ],
          version: "2.29.1"
        }.to_json
      }
    }
    quest_event
  end
end
