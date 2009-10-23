module Jekyll

  class HighlightBlock < Liquid::Block
    include Liquid::StandardFilters

    # we need a language, but the linenos argument is optional.
    SYNTAX = /(\w+)\s?(:?linenos)?\s?/

    def initialize(tag_name, markup, tokens)
      super
      if markup =~ SYNTAX
        @lang = $1
        if defined? $2
          # additional options to pass to Albino.
          @options = { 'O' => 'linenos=inline' }
        else
          @options = {}
        end
      else
        raise SyntaxError.new("Syntax Error in 'highlight' - Valid syntax: highlight <lang> [linenos]")
      end
    end

    def render(context)
      if context.registers[:site].pygments
        render_pygments(context, super.to_s)
      else
        render_codehighlighter(context, super.to_s)
      end
    end

    def render_pygments(context, code)
      if context["content_type"] == "markdown"
        return "\n" + add_code_tags(Albino.new(code, @lang).to_s(@options), @lang) + "\n"
      elsif context["content_type"] == "textile"
        return "<notextile>" + add_code_tags(Albino.new(code, @lang).to_s(@options), @lang) + "</notextile>"
      else
        return add_code_tags(Albino.new(code, @lang).to_s(@options), @lang)
      end
    end

    def render_codehighlighter(context, code)
    #The div is required because RDiscount blows ass
      <<-HTML
<div>
  <pre>
    <code class='#{@lang}'>#{h(code).strip}</code>
  </pre>
</div>
      HTML
    end
    
    def add_code_tags(code, lang)
      # Add nested <code> tags to code blocks
      code = code.sub(/<pre>/,'<pre><code class="' + lang + '">')
      code = code.sub(/<\/pre>/,"</code></pre>")
    end
    
  end

end

Liquid::Template.register_tag('highlight', Jekyll::HighlightBlock)
