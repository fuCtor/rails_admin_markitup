module ViewHelpers
  def parse_markdown(markdown)
    RailsAdminMarkitup::MARKDOWN_PARSER.render(markdown).html_safe
  end
end