class Book
  attr_accessor :id, :name, :description, :author, :sold
  
  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def self.all
    @books = []
    books_json = HTTParty.get(Rails.configuration.api_url+'books.json').parsed_response
    books_json.map{|b| @books.push( Book.new(:id => b['id'], :name => b['name'], :description => b['description'], :author => b['author'], :sold => b['sold'])  )}
    return @books
  end

  def self.find (id)
    @book = nil
    if not id.blank?
      book_json = HTTParty.get(Rails.configuration.api_url+'books/'+id.to_s+'.json').parsed_response
      if not book_json.nil?
        @book = Book.new(:id => book_json['id'], :name => book_json['name'], :description => book_json['description'], :author => book_json['author'], :sold => book_json['sold'])
      end
    end
  end

  def buy
    HTTParty.get(Rails.configuration.api_url+'books/'+self.id.to_s+'/buy')
  end
end
