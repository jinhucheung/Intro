class CreateIntroTours < ActiveRecord::Migration
  def change
    create_table :intro_tours do |t|
      t.string   :ident,                null: false
      t.string   :controller_path,      null: false, default: ''
      t.string   :action_name,          null: false, default: ''
      t.text     :route
      t.text     :options
      t.boolean  :posted,               default: false
      t.datetime :posted_at
      t.datetime :expired_at
      t.timestamps null: false
    end

    add_index :intro_tours, :ident, unique: true
    add_index :intro_tours, [:controller_path, :action_name, :posted], name: 'index_intro_tours_on_controller_and_action_and_posted'
  end
end