class RenameAuthorNameAuthorDesignationForClientTestimonial < ActiveRecord::Migration[7.0]
  def change
    change_table :client_testimonials do |t|
      t.rename :author_name, :name
      t.rename :author_designation, :designation
    end
  end
end
