defmodule Chucky.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: {:global, __MODULE__})
  end

  def init([]) do
    :random.seed(:os.timestamp())

    facts =
    ["Once a Police officer caught Rajinikanth, the cop was lucky enough to escape with a warning",
 "Rajinikanth can make onions cry!", "Rajinikanth can watch the Radio !",
 "Rajinikanth once took 15 wickets in an one day match",
 "People call 100 for Police help, Police calls Rajinikanth for Help",
 "Rajinikanth knows Victoria's Secret !",
 "Rajinikanth built the hospital he was born in",
 "Harvard got it's MBA from Rajinikanth",
 "Rajinikanth knows the last digit of pi",
 "Once Rajinikanth bite an apple and threw it away, not its is known as Apple computers logo",
 "There is no April 1st in Rajini calendar, because no one can fool him",
 "Dark spots on the Moon are the result of Rajinikanth's shooting practice",
 "Rajinikanth can Like a Facebook post even before it is posted",
 "Rajinikanth died before 20 years, Death doesn't have the courage to tell him yet",
 "Once Rajinikanth kicked a man, later he is remembered for being the first Man to Land on Moon",
 "When anyone says \"No one is Perfect\", Rajinikanth takes it as a personal insult.",
 "Rajinikanth can delete the Recycle Bin !"]

    {:ok, facts}
  end

  def fact do
    GenServer.call({:global, __MODULE__}, :fact)
  end

  def handle_call(:fact, _from, facts) do
    random_fact =
      facts
      |> Enum.shuffle()
      |> List.first()

    {:reply, random_fact, facts}
  end
end
