json.array!(@books) do |book|
  json.extract! book, :id, :name, :author, :sold
end
