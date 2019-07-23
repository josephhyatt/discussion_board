module ApplicationHelper
  # found this code online to get markdown to work in my discussion
  # requiring redcarpet library
  # render_strip is a plugin that strips markdown from
  # a field of text on the index (the root) page
  require 'redcarpet/render_strip'
  # checks users role (using for admin privileges)
  def has_role?(role)
    current_user && current_user.has_role?(role)
  end
  # class that uses the coderay gem that inherits from redcarpet
  class CodeRayify < Redcarpet::Render::HTML
    # block code method, passing in code and language
    def block_code(code, language)
      CodeRay.scan(code,language).div
    end
  end
  # defined a helper called markdown
  def markdown(text)
    # using the CodeRayify class we just definded creating a new act method
    # were going to filter_html (hash rocket) to true
    # hard_wrap (hash rocket) to true
    coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true, :smartypants => true)
    # definding markdown options
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true
    }
    # accesses the markdown method, passing in the coderayified variable created on line 19
    # and pasing in the options variable on line 21
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    # calling again and render the text we pass through
    # and call .html_safe to render html on the front end
    markdown_to_html.render(text).html_safe
  end
  # method thats called to remove markdown and is rendered on line 6
  def strip_markdown(text)
    # strips markdown to plan text which is called on line 6
    markdown_to_plain_text = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    markdown_to_plain_text.render(text).html_safe
  end

end
