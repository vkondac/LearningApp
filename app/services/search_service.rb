# frozen_string_literal: true
class SearchService
  def self.duvajga(params)
    query = Book.all
    query = query.where("name LIKE ?", "%#{params[:name]}%").order("id DESC") if params[:name].present?
    query = query.where("author LIKE ?", "%#{params[:author]}%").order("id DESC") if params[:author].present?
    return query
  end
end
