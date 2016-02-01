# _plugins/post.rb
module Jekyll

  class Post

    # override post method in order to return categories names as slug
    # instead of strings
    #
    # An url for a post with category "category with space" will be in
    # slugified form : /category-with-space
    # instead of url encoded form : /category%20with%20space
    #
    # @see utils.slugify
    def url_placeholders
      {
        :year        => date.strftime("%Y"),
        :month       => date.strftime("%m"),
        :day         => date.strftime("%d"),
        :title       => slug,
        :i_day       => date.strftime("%-d"),
        :i_month     => date.strftime("%-m"),
        :categories  => (categories || []).map { |c| Utils.slugify(c) }.uniq.join('/'),
        :short_month => date.strftime("%b"),
        :short_year  => date.strftime("%y"),
        :y_day       => date.strftime("%j"),
        :output_ext  => output_ext
      }
    end

  end

  class URL
    alias :old_sanitize_url :sanitize_url
    def sanitize_url(str)
      old_sanitize_url(str).gsub(/ /, "-")
    end
    # XXX I changed this to remove spaces in my categories URL

    # Internal: Generate the URL by replacing all placeholders with their
    # respective values in the given template
    #
    # Returns the unsanitized String URL
    def generate_url(template)
      @placeholders.inject(template) do |result, token|
        break result if result.index(':').nil?
        if token.last.nil?
          # Remove leading '/' to avoid generating urls with `//`
          result.gsub(/\/:#{token.first}/, '')
        else
          result.gsub(/:#{token.first}/, self.class.escape_path(token.last.gsub(/ /, "-")))
        end
      end
    end
  end

end
