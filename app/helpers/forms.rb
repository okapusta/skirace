module Forms

  def form_for(action, resource, opts = {}, &block)
    return unless block_given?
  end

  def input_tag(resource, attribute, opts = {})
    content_tag(:input, nil, {type: 'text', name: "#{resource.to_s}[#{attribute.to_s}]"}.merge(opts))
  end

  def form_tag(content = nil, opts = {})
    content_tag(:form, content, opts)
  end

  def label_tag(content, resource, opts = {})
    content_tag(:label, content, {for: resource.to_s}.merge(opts))
  end

  def submit_tag(value = nil, opts = {})
    content_tag(:input, nil, {type: 'submit', value: value}.merge(opts))
  end

  def tag_options(options, escape)
    options.map{ |k,v| " #{k}='#{v}'" }.join
  end

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