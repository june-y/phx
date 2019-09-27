# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Test.Repo.insert!(%Test.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Test.Repo
alias Test.Orders.Pharmacy
alias Test.Orders.Courier

Repo.insert! %Pharmacy{
  name: "BetterRx",
  address: "1275 Kinnear Road, Columbus, OH 43212"
}

Repo.insert! %Pharmacy{
  name: "BestRx",
  address: "123 Austin St, Austin, TX 78702"
}

Repo.insert! %Pharmacy{
  name: "Drugs R Us",
  address: "4925 LA Ave, Los Angeles, CA 90056"
}


Repo.insert! %Courier{
  name: "Same Day Delivery",
  address: "900 Trenton Lane, Trenton, NJ 08536",
  pharmacies_serviced: ["BetterRx","BestRx"]
}

Repo.insert! %Courier{
  name: "Previous Day Delivery",
  address: "7433 LA Ct, Los Angeles, CA 90056",
  pharmacies_serviced: ["Drugs R Us"]
}
