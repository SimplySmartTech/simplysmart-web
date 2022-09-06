class CreateClientTestimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :client_testimonials do |t|
      t.string :testimonial, default:"-"
      t.string :author_name, default: "-"
      t.string :author_designation, default: "-"
      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
