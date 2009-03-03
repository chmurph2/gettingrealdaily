require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'active_support'

# Parse the Getting Real table of contents, returning an array of arrays of
# essay information: [chapter title (chapter #): essay title, uri]
def parse
  returning essays = [] do
    # English translation only for now
    doc = Hpricot(open("http://gettingreal.37signals.com/toc.php"))
    (doc/"#Container/h2").each do |h2|
      chapter_abbreviation = h2.at("a").attributes['name']
      chapter = (h2/"span").inner_html.capitalize
      (h2/"a|span").remove # kill everything but the title
      chapter_title = h2.inner_html.rstrip
      (doc/"#Container/ul/li/a[@href*='#{chapter_abbreviation}']").each do |a|
        essay_title = a.inner_html
        essay_link = a.attributes['href']
        essays << ["#{chapter_title} (#{chapter}): #{essay_title}", "#{essay_link}"]
      end
    end
  end
end

# Uncomment to see the array.  I just copied it over to the actual feed generation script.
# puts parse.inspect
