class AddCommentableToComments < ActiveRecord::Migration[5.2]
  def change
    # Usuwamy ograniczenie klucza obcego dla kolumny article_id w tabeli index_comments_on_article_id
    # Dzięki temu po zmianie nazwy kolumna ta będzie mogła odnosić się do czegoś innego  niż artykuł
    remove_foreign_key :comments, :articles

    # Od teraz article_id niech nazywa się commentable_id
    rename_column :comments, :article_id, :commentable_id
    
    add_column :comments, :commentable_type, :string, null: false, default: 'Article'

    add_index :comments, [:commentable_type, :commentable_id]


  end
end
