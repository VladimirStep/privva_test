# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

reporters = []

3.times do |index|
  index += 1
  reporter = User.create(
    name: "Reporter_#{index}",
    email: "reporter_#{index}@example.com"
  )
  reporters << reporter
end

assignees = []

2.times do |index|
  index += 1
  assignee = User.create(
    name: "Assignee_#{index}",
    email: "assignee_#{index}@example.com"
  )
  assignees << assignee
end

statuses = %w[active archived]

reporters.each do |reporter|
  5.times do |index|
    index += 1
    Issue.create(
      summary: "Summary of issue #{index}",
      status: statuses.sample,
      reporter: reporter,
      assignee: assignees.sample
    )
  end
end