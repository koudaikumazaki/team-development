crumb :root do
  link "投稿一覧", root_path
end

crumb :show_post do |post|
  link "#{post.user.name}さんの投稿(#{post.id})"
  parent :root
end

crumb :edit_post do |post|
  link "#{post.user.name}さんの投稿(#{post.id})の編集"
  parent :root
end

crumb :new_post do
  link "新規投稿", new_post_path
  parent :root
end
