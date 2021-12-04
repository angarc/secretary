FactoryBot.define do
  factory :task do
    name { "My Cool Task" }
    deadline { "2021-12-04 01:30:13" }
    duration_hours { 2 }
    duration_minutes { 30 }
    description { "Just a simple task" }
    split_up { false }
    user { nil }
  end
end
