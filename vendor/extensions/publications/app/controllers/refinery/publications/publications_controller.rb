module Refinery
  module Publications
    class PublicationsController < ::ApplicationController

      before_filter :find_all_publications
      before_filter :find_page

      def index
        @publications = Publication.all
        @journals = Publication.where(category: 'Journals')
        @textbooks = Publication.where(category: 'Textbooks')
        @conferences = Publication.where(category: 'Conferences')
        @reports = Publication.where(category: 'Technical Reports')
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @publication in the line below:
        present(@page)
      end

      def show
        @publication = Publication.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @publication in the line below:
        present(@page)
      end

    protected

      def find_all_publications
        @publications = Publication.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/publications").first
      end

    end
  end
end
