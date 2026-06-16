# Clear existing data to allow re-running the seed file cleanly (idempotent)
PostEditor.destroy_all
Post.destroy_all
Editor.destroy_all
User.destroy_all

# Create Users
users = []
5.times do |i|
  users << User.create!(
    name: "User #{i + 1}",
    email: "user#{i + 1}@example.com"
  )
end
puts "Created #{User.count} users."

# Create Editors
editors = []
5.times do |i|
  editors << Editor.create!(
    name: "Editor #{i + 1}"
  )
end
puts "Created #{Editor.count} editors."

# Create Posts (One-to-Many)
posts = []
users.each_with_index do |user, index|
  3.times do |j|
    posts << Post.create!(
      title: "Post #{j + 1} by #{user.name}",
      body: "This is the content of post #{j + 1} created by #{user.name}.",
      creator: user
    )
  end
end
puts "Created #{Post.count} posts."

# Associate Editors to Posts (Many-to-Many)
posts.each do |post|
  # Assign 2 random editors to each post
  selected_editors = editors.sample(2)
  selected_editors.each do |editor|
    PostEditor.create!(post: post, editor: editor)
  end
end
puts "Associated editors to posts: #{PostEditor.count} assignments."
