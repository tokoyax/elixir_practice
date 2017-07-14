defmodule SampleFunc do
  def hello(person) do
    IO.puts "Hello, #{person}. My pid is #{inspect self()}."
    receive do
      message -> IO.puts "Message is #{message}."
    end
  end

  def hello2(person) do
    IO.puts "Hello, #{person}. My pid is #{inspect self()}."
    receive do
      message ->
        IO.puts "Message is #{message}."
        hello2 person
    end
  end
end

defmodule Server do
  use GenServer
end

defmodule Counter do
  use GenServer

  def init(state) do
    IO.puts "--- init(#{inspect state}) called ---"
    {:ok, state}
  end

  def handle_call(:up, from, state) do
    IO.puts "--- handle_call(:up, #{inspect from}, #{inspect state}) called ---"
    state = state + 1
    {:reply, "result: count up to #{inspect state}", state}
  end

  def handle_call(:down, from, state) do
    IO.puts "--- handle_call(:down, #{inspect from}, #{inspect state}) called ---"
    state = state - 1
    {:reply, "result: count down to #{inspect state}", state}
  end

  def handle_cast(:up, state) do
    IO.puts "--- handle_cast(:up, #{inspect state}) called ---"
    state = state + 1
    IO.puts "--- state -> #{state} ---"
    {:noreply, state}
  end

  def handle_cast(:down, state) do
    IO.puts "--- handle_cast(:down, #{inspect state}) called ---"
    state = state - 1
    IO.puts "--- state -> #{state} ---"
    {:noreply, state}
  end

end
