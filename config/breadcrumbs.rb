crumb :root do
  link "メルカリ", root_path
end

crumb :brands do
  link "ブランド一覧", brands_path
  parent :root
end

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :item do |item|
  link item.name, item_path(item)
  parent :root
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :mypage
end

crumb :userAddress do
  link "本人情報の登録", edit_address_path
  parent :mypage
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end

crumb :category do |category|
  link category.name, category
  parent :categories
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
