# coding: utf-8
# Author: Shane Celis (@shanecelis)
#
# Allows you to expand or compress acronyms and abbreviations.  It
# looks for a _data/abbreviations.yml file.  It might look like this:
#
#     ---
#     WWW: "World Wide Web"
#     UI: "User Interface"
#     ...
#
# One can both "expand" an abbreviation into its full name, or one can
# "compress" a full name into its abbreviation.
#
# Usage: {{ "What in the WWW" | abbr_expand }}
# Output: "What in the World Wide Web"

require 'yaml'

module Jekyll
  module AbbreviationsFilter

    def abbr_expand(input)
      input = input.dup
      site = @context.registers[:site]
      if site.data.key?('abbreviations')
        site.data['abbreviations'].each do |abbr, title|
          input.gsub! /\b#{abbr}\b/, title
        end
      end
      input
    end

    def abbr_compress(input)
      input = input.dup
      site = @context.registers[:site]
      if site.data.key?('abbreviations')
        site.data['abbreviations'].each do |abbr, title|
          input.gsub! /\b#{title}\b/, abbr
        end
      end
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::AbbreviationsFilter)
