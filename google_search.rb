require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Link
  attr_accessor :url, :title, :description
end

class Page
  attr_reader :next, :previous, :links

  def initialize(query, start=nil)
    res = open("https://www.google.com/search?q=#{query}&start=#{start}")
    @doc = Nokogiri::HTML.parse(res.read)
    @next = start.to_i + 10
    @previous = start.to_i - 10
    parse_results
  end

  private

  def parse_results
    @links = []
    @doc.css('.g').each do |result|
      link = Link.new
      link.title = result.css('.r').text
      link.url = result.css('.s cite').text
      link.description = result.css('.s span.st').text
      @links << link
    end
  end

end

class Google
  def initialize
    @searching = true
    begin_search
    action
  end

  private

  def query
    puts "\n\nGetting Search Results"
    @current_page = Page.new(@search)
  end

  def get_next
    puts "\n\nGetting Next Page..."
    @current_page = Page.new(@search, @current_page.next)
  end

  def get_previous
    puts "\n\nGetting Previous Page..."
    @current_page = Page.new(@search, @current_page.previous)
  end

  def searching?
    @searching
  end

  def action
    while (searching?) do
      print_results
      request = gets.chomp!
      determine_action(request)
    end
  end

  def determine_action(request)
    # request is a number
    if request.to_i > 0
      link = @current_page.links[request.to_i - 1]
      if link
        `open #{link.url}`
      else
        puts "Invalid Request...\n\n"
      end
    elsif request.to_s == 'n'
      get_next
    elsif request.to_s == 'p'
      get_previous
    elsif request.to_s == 'q'
      @searching = false
    elsif request.to_s == 's'
      begin_search
    else
      puts "Invalid Request...\n\n"
    end
  end

  def begin_search
    puts "Welcome to Google, What would you like to search for?"
    @search = gets.chomp!.to_s
    query
  end

  def print_results
    puts "\n\n\n"
    puts "Google Results for #{@search}"
    puts "========================================"
    @current_page.links.each_with_index do |link, i| 
      puts "#{i + 1}: #{link.title} (#{link.url})"
      slice_description(link.description)
      puts "========================================"
    end
    puts "Enter a number or one of the following:"
    puts "n - next page"
    if @current_page.previous >= 0
      puts "p - previous page"
    end
    puts "s - start a new search"
    puts "q - quit"
  end

  def slice_description(description)
    words = description.split(" ")
    words.each_slice(5) do |slice|
      puts "   #{slice.join(" ")}"
    end
  end
end

Google.new
