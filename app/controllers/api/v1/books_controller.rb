module Api
  module V1
    class BooksController < ApplicationController
      ALLOWED_DATA = %[title description rating].freeze

      def fetch_all
        books = Book.all
        # render json: books, except: :title
        render json: books
      end

      def single_book
        book = Book.find(params[:id])
        render json: book
      end

      def create
        data = json_payload.select { |k| ALLOWED_DATA.include?(k) }
        book = Book.new(data)

        if book.save
          render json: book
        else
          render json: { "error": "Couldn't create a book" }
        end
      end

      def delete
        Book.destroy(params[:id])
      end
    end
  end
end
