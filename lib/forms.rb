module Forms


  ## Ruby on Rails latest stable (v3.2.13)

  # File actionpack/lib/action_view/helpers/tag_helper.rb, line 92
  def content_tag(name, content_or_options_with_block = nil, options = nil, escape = true, &block)
    if block_given?
      options = content_or_options_with_block if content_or_options_with_block.is_a?(Hash)
      content_tag_string(name, capture(&block), options, escape)
    else
      content_tag_string(name, content_or_options_with_block, options, escape)
    end
  end

  # File actionpack/lib/action_view/helpers/tag_helper.rb, line 130
  def content_tag_string(name, content, options, escape = true)
    tag_options = tag_options(options, escape) if options
    "<#{name}#{tag_options}>#{PRE_CONTENT_STRINGS[name.to_sym]}#{escape ? ERB::Util.h(content) : content}</#{name}>"
  end

  PRE_CONTENT_STRINGS =
  {
    :textarea => "\n"
  }
end