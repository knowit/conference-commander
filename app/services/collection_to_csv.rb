require "csv"

class CollectionToCSV
  DEFAULT_OPTIONS = { col_sep: "," }

  def self.perform(collection, attrs, opts = {})
    new(collection, attrs, opts).perform
  end

  attr_reader :collection, :attrs, :opts

  def initialize(collection, attrs, opts)
    @collection = Array(collection)
    @attrs = attrs
    @opts = merge_opts(opts)
  end

  def perform
    CSV.generate(headers: true, col_sep: opts[:col_sep]) do |csv|
      csv << attrs

      collection.each do |item|
        csv << attrs.map{ |attr| item.send(attr) }
      end
    end
  end

  def merge_opts(opts)
    DEFAULT_OPTIONS.merge(opts)
  end
end
