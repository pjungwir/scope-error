Demonstration of Rails issue 9813
=================================

Using this project, run `rake db:migrate`, then observe this behavior at the Rails console:

    > User.create!(name: "Fred")
    > puts User.first.projects.to_sql
    SELECT "projects".* FROM "projects"  WHERE "projects"."user_id" = 1
    > puts User.first.projects.where(user_id: 5).to_sql
    SELECT "projects".* FROM "projects"  WHERE "projects"."user_id" = 1 AND "projects"."user_id" = 5
    > puts User.first.projects.for_special_users.to_sql
    SELECT "projects".* FROM "projects"  WHERE "projects"."user_id" = 5

In the last command, the `for_special_users` scope wipes out the `has_many` relationship.

