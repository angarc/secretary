FactoryBot.define do
  factory :task do
    title { "My Cool Task" }
    deadline { DateTime.now + 5.days }
    duration { "02:30" }
    duration_hours { 2 }
    duration_minutes { 30 }
    description { "Just a simple task" }
    split_up { false }
    user { nil }
  end
end
