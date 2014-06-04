module RailsAdminMarkitup
  MARKDOWN_PARSER = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
end

Markitup::Rails.configure do |config|
  config.formatter = -> markup { RailsAdminMarkitup::MARKDOWN_PARSER.render(markup) }
end